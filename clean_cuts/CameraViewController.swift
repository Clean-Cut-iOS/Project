//
//  CameraViewController.swift
//  clean_cuts
//
//  Created by Priyam Gupta on 4/1/23.
//

import UIKit
import Firebase
import FirebaseStorage
import PhotosUI

class CameraViewController: UIViewController {
    
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let imageData = postImageView.image?.pngData() else {
            print("no image data")
            return
        }
        
        let storageRef = FirebaseStorage.Storage.storage().reference()
        guard let userUID = Firebase.Auth.auth().currentUser?.uid else {
            print("can't get current user")
            return
        }
        let fileRef = storageRef.child("\(userUID)/\(Date().timeIntervalSince1970.formatted()).png")
        let uploadTask = fileRef.putData(imageData, metadata: nil) {
            metadata, error in
            guard metadata != nil else { return }
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            fileRef.downloadURL { url, error in
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
                
                guard let u = url else {
                    print("Unable to get photo url")
                    return
                }
                
                var post:[String:Any] = [String:Any]()
                post["caption"] = self.captionField.text
                post["image"] = u.absoluteString
                
                post["timestamp"] = FieldValue.serverTimestamp()
                
                guard let username = Firebase.Auth.auth().currentUser?.email else {
                    print("Cannot set author of post")
                    return
                }
                
                post["author"] = username[..<(username.firstIndex(of: "@") ?? username.endIndex)]
                post["authorUID"] = "\(userUID)"
                
                let postID = "\(userUID)-post\(Date().timeIntervalSince1970.formatted())"
                
                let db = Firestore.firestore()
                db.collection("posts").document(postID).setData(post) { error in
                    if let e = error {
                        print(e.localizedDescription)
                        return
                    }
                    
                    print("Post successfully written!")
                    db.collection("user_data").document(userUID).setData([ "lastCreated": FieldValue.serverTimestamp() ]) { e in
                        if let e = error {
                            print(e.localizedDescription)
                        }
                        
                        self.navigationController?.popViewController(animated: true)
                        
                    }
                    
                }
            }
        }
    }
    
    @IBAction func OnCameraButton(_ sender: Any) {
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) != .authorized {
            // Request photo library access
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
                switch status {
                case .authorized:
                    // The user authorized access to their photo library
                    // show picker (on main thread)
                    DispatchQueue.main.async {
                        self?.presentImagePicker()
                    }
                default:
                    // show settings alert (on main thread)
                    DispatchQueue.main.async {
                        // Helper method to show settings alert
                        self?.presentGoToSettingsAlert()
                    }
                }
            }
        } else {
            // Show photo picker
            presentImagePicker()
        }
    }
    
    func presentGoToSettingsAlert() {
        let alertController = UIAlertController (
            title: "Photo Access Required", message: "In order to post a photo to complete a task, we neet access to your photo library. You can allow access in Settings", preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl)
            }
        }
        
        alertController.addAction(settingsAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentImagePicker() {
        // TODO: Create, configure and present image picker.
        // Create a configuration object
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        
        // Set the filter to only show images as options (i.e. no videos, etc.).
        config.filter = .images
        
        // Request the original file format. Fastest method as it avoids transcoding.
        config.preferredAssetRepresentationMode = .current
        
        // Only allow 1 image to be selected at a time
        config.selectionLimit = 1
        
        // Instantiate a picker, passing in the configuration.
        let picker = PHPickerViewController(configuration: config)
        
        // Set the picker delegate so we can receive whatever image the user picks
        picker.delegate = self
        
        // present the picker.
        present(picker, animated: true)
    }

    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension CameraViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Dismiss the picker
        picker.dismiss(animated: true)
        
        // Get the selected image asset (we can grab the 1st item in the array since we only allowed a selection limit of 1)
        let result = results.first
        
        // Make sure we have a non-nil item provider
        guard let provider = result?.itemProvider,
              // Make sure the provider can load a UIImage
              provider.canLoadObject(ofClass: UIImage.self) else { return }
        
        // Load a UIImage from the provider
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            
            // Handle any errors
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            // Make sure we can cast the returned object to a UIImage
            guard let image = object as? UIImage else { return }
            
            print("🌉 We have an image!")
            
            // UI updates should be done on main thread, hence the use of 'DispatchQueue.main.async'
            DispatchQueue.main.async { [weak self] in
                self?.postImageView.image = image
            }
        }
    }
}
