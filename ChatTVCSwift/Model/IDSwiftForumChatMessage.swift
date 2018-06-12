//
//  IDSwiftForumChatMessage.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 12/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftForumChatMessage: IDSwiftChatMessage {
    public lazy var messageFrom: String = String()
    
    convenience init(messageFrom: String, message: String, messageTimeStamp: String, senderId: String, contentImageId: String, isOwnMessage: Bool) {
        self.init(message: message, messageTimeStamp: messageTimeStamp, senderId: senderId, contentImageId: contentImageId, isOwnMessage: isOwnMessage)
        
        self.messageFrom = messageFrom
    }
}
