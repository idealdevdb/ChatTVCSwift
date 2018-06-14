//
//  IDSwiftForumCellTest.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 13/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftForumCellTest: IDSwiftForumCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        super.setupLayoutForMessage(message)

        self.lblFrom.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        if message.isOwnMessage {
            self.lblFrom.textColor = UIColor.green
        } else {
            self.lblFrom.textColor = UIColor.black
        }
        
        self.txtMessage.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.txtMessage.textColor = UIColor.lightGray
        
        if message.isOwnMessage {
            self.profileImageView?.image = UIImage(named: "person1.png")
        } else {
            self.profileImageView?.image = UIImage(named: "person2.png")
        }
    }
}
