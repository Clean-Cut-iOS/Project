//
//  PostCell.swift
//  clean_cuts
//
//  Created by Samuel Akinniranye on 4/5/23.
//

import UIKit
import AlamofireImage
import Firebase
class PostCell: UITableViewCell {
    
    
    
    @IBOutlet var postImageView: UIImageView!
    
    
    @IBOutlet var postAuthorLabel: UILabel!
    
    
    @IBOutlet var postCaptionLabel: UILabel!
    

    
    func configure(with post: [String: Any]) {
        if let author = post["author"] as? String {
            postAuthorLabel.text = author
        }
        
        if let caption = post["caption"] as? String {
            postCaptionLabel.text = caption
        }
        
        if let imageLink = post["image"] as? String,
           let url = URL(string: imageLink) {
            postImageView.af.setImage(withURL: url)
        }
    }
        
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
