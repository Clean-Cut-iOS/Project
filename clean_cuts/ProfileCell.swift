//
//  ProfileCell.swift
//  clean_cuts
//
//  Created by Bryson Smith on 4/7/23.
//

import UIKit
import AlamofireImage
import Firebase


class ProfileCell: UITableViewCell {
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var profileAuthorLabel: UILabel!
    
    @IBOutlet var profileCaptionLabel: UILabel!
    
    
    func configure(with post: [String: Any]) {
        if let author = post["author"] as? String {
            profileAuthorLabel.text = author
        }
        
        if let caption = post["caption"] as? String {
            profileCaptionLabel.text = caption
        }
        
        if let imageLink = post["image"] as? String,
           let url = URL(string: imageLink) {
            profileImageView.af.setImage(withURL: url)
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

