//
//  PostCell.swift
//  InstagramUI
//
//  Created by Ivor D. Addo on 4/4/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var numberOfLikesButton: UIButton!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }

    func updateUI() {
        self.postImageView.image = post.image
        postCaption.text = post.caption
        numberOfLikesButton.setTitle("Be the first one to comment to share a comment", for: [])
        timeAgoLabel.text = post.timeAgo
        
        
    }
    
}
