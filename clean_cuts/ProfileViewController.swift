//
//  ProfileViewController.swift
//  clean_cuts
//
//  Created by Bryson Smith on 3/8/23.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableViewProfile.dequeueReusableCell(withIdentifier: "profileCell") as! PostCell
        
        let post = self.posts[indexPath.row]
        cell1.reconfigure(with: post)
        return cell1
    }
    
    
   
    @IBOutlet var tableViewProfile: UITableView!
    

    
    var posts: [[String:Any]] = [[String:Any]]()
    
    @IBOutlet weak var bottomLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableViewProfile.delegate = self
        tableViewProfile.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.posts.removeAll()
        
        let postsRef = Firestore.firestore().collection("posts")
        postsRef.order(by: "timestamp", descending: true).limit(to: 10).getDocuments { querySnapshot, error in
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let results = querySnapshot else {
                print("No results returned!")
                return
            }
            
            for document in results.documents {
                self.posts.append(document.data())
            }
            self.tableViewProfile.reloadData()
        }
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
