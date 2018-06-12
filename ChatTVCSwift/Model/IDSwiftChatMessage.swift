//
//  ChatMessageSwift.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class IDSwiftChatMessage {
    public lazy var message: String = String()
    public lazy var messageTimeStamp: String = String()
    public lazy var senderId: String = String()
    public lazy var contentImageId: String = String()
    public lazy var isOwnMessage: Bool = Bool()
    
    public init(message: String, messageTimeStamp: String, senderId: String, contentImageId: String, isOwnMessage: Bool) {
        self.message = message
        self.messageTimeStamp = messageTimeStamp
        self.senderId = senderId
        self.contentImageId = contentImageId
        self.isOwnMessage = isOwnMessage
    }
}
