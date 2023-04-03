//
//  LoginViewController.swift
//  clean_cuts
//

//  Created by Samuel Akinniranye on 3/8/23.
//  Created by Priyam Gupta on 3/20/23.

//  Created by Priyam Gupta on 3/27/23.

//

import UIKit
import Firebase

class LoginViewController: UIViewController {



    @IBOutlet var Username: UITextField!
    
    @IBOutlet var Password: UITextField!
    
    @IBOutlet var Login: UIButton!
    
    @IBOutlet var Signup: UIButton!

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func onSignIn(_ sender: Any) {
        guard let username = usernameField.text,
              let password = passwordField.text else {
            print("username or password is nil!")
            return
        }
        
        Firebase.Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let res = result else {
                print("Error occurred with logging in")
                return
            }
            
            print("Signed in as \(res.user.email)")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        guard let username = usernameField.text,
              let password = passwordField.text else {
            print("username or password is nil!")
            return
        }
        
        Firebase.Auth.auth().createUser(withEmail: username, password: password) { result, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let res = result else {
                print("Error occurred with signing up")
                return
            }
            
            print("Signed up new user as \(res.user.email)")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
            
        }
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
