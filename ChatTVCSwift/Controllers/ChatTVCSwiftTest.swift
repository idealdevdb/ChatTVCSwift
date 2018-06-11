//
//  ChatTVCSwiftTest.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

class ChatTVCSwiftTest: ChatTVCSwift {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.constructMessages()
    }
    
    func constructMessages() {
        let c1: ChatMessageSwift = ChatMessageSwift(message: "Hej med dig", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
        let c2: ChatMessageSwift = ChatMessageSwift(message: "Lang besked her Lang besked herLang besked herLang besked herLang besked herLang besked herLang besked herLang besked her", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
        let c3: ChatMessageSwift = ChatMessageSwift(message: "Går det godt?", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
        let c4: ChatMessageSwift = ChatMessageSwift(message: "Det går fint", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
        let c5: ChatMessageSwift = ChatMessageSwift(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
        
        self.messages.append(c1)
        self.messages.append(c2)
        self.messages.append(c3)
        self.messages.append(c4)
        self.messages.append(c5)
        
        self.reloadMessages(scrollAnimated: true)
    }
}
