//
//  IDSwiftForumChatCell.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 12/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftForumChatCell: IDSwiftChatCell {

    @IBOutlet weak var lblFrom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        if let message_: IDSwiftForumChatMessage = message as? IDSwiftForumChatMessage {
            if message_.isOwnMessage {
                self.imgFrom.isHidden = true
                self.lblFrom.text = "You"
            } else {
                self.imgFrom.isHidden = false
                self.lblFrom.text = message_.messageFrom
            }
        }
    }
}
