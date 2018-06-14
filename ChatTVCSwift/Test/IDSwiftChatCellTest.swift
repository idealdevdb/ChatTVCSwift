//
//  IDSwiftChatCellTest.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 13/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftChatCellTest: IDSwiftChatCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.bubbleImageLocalUser = UIImage(named: "chat_bubble_green")
        self.bubbleImageRemoteUser = UIImage(named: "chat_bubble_grey")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        super.setupLayoutForMessage(message)
        
        if message.isOwnMessage {
            self.profileImageView?.image = UIImage(named: "person1.png")
        } else {
            self.profileImageView?.image = UIImage(named: "person2.png")
        }
    }
}
