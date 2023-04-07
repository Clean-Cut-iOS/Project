//
//  PostViewController.swift
//  clean_cuts
//
//  Created by Irfan Hussain on 3/22/23.
//

import UIKit
import Firebase

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        let post = self.posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    

    
    @IBOutlet var postsTableView: UITableView!
    
    
    var posts: [[String:Any]] = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        postsTableView.delegate = self
        postsTableView.dataSource = self

        
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
            self.postsTableView.reloadData()
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
