//
//  IDSwiftForumCell.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 12/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftForumCell: IDSwiftChatCell {

    @IBOutlet weak var lblFrom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.profileImageView?.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        super.setupLayoutForMessage(message)
        
        if let message_: IDSwiftForumChatMessage = message as? IDSwiftForumChatMessage {
            if message_.isOwnMessage {
                self.profileImageView?.isHidden = true
                self.lblFrom?.text = "You"
            } else {
                self.profileImageView?.isHidden = false
                self.lblFrom?.text = message_.messageFrom
            }
        }
    }
}
