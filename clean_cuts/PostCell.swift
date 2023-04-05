//
//  PostCell.swift
//  clean_cuts
//
//  Created by Samuel Akinniranye on 4/5/23.
//

import UIKit

class PostCell: UITableViewCell {
    
    
    
    @IBOutlet var postImageView: UIImageView!
    
    
    @IBOutlet var postAuthorLabel: UILabel!
    
    
    @IBOutlet var postCaptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
