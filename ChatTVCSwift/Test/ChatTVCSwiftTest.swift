//
//  ChatTVCSwiftTest.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit
import IDCommonNeedsSwift

class ChatTVCSwiftTest: IDSwiftChatTVC {
        
    override func viewDidLoad() {
        self.showCameraButton = true
        self.showLocateMeButton = true
        self.chatType = .chat
        
        super.viewDidLoad()

        self.constructMessages()
        
        self.view.backgroundColor = UIColor(red: 0.917647, green: 0.917647, blue: 0.917647, alpha: 1.000000)
    }
    
    override func setupTextView() {
        super.setupTextView()
        
        self.textViewToTypeIn.contentView.backgroundColor = UIColor(red: 0.917647, green: 0.917647, blue: 0.917647, alpha: 1.000000)
        self.textViewToTypeIn.messageTextView.layer.cornerRadius = 4
        self.textViewToTypeIn.messageTextView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.textViewToTypeIn.messageTextView.textColor = UIColor(red: 0.200000, green: 0.200000, blue: 0.200000, alpha: 1.000000)
        self.textViewToTypeIn.messageTextView.layer.borderColor = UIColor.clear.cgColor
        
        let sendTitle: String = NSLocalizedString("SEND", comment: "")
        let buttonTitle: NSAttributedString = NSAttributedString(string: sendTitle, with: UIFont.systemFont(ofSize: 13, weight: .semibold), withSpacing: 0.6, andColor: UIColor(red: 0.274510, green: 0.811765, blue: 0.784314, alpha: 1.000000))
        
        self.textViewToTypeIn.sendButton.setAttributedTitle(buttonTitle, for: UIControlState())
        self.textViewToTypeIn.messageTextView.placeholder =  NSLocalizedString("Skriv din besked her ...", comment: "")
        self.textViewToTypeIn.sendButton.backgroundColor = UIColor.clear
        
        self.textViewToTypeIn.addInputButtonWithImage(UIImage(named: "person1.png"), andTarget: self, andAction: #selector(self.dummyAction))
    }
    
    @objc func dummyAction() {
        
    }
    
    override func getCellNibName() -> String {
        if self.chatType == .chat {
            return String(describing: IDSwiftChatCellTest.self)
        }
        
        return String(describing: IDSwiftForumCellTest.self)
    }
    
    func constructMessages() {
        if self.chatType == .chat {
            let c1: IDSwiftChatMessage = IDSwiftChatMessage(message: "Hej med dig", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c2: IDSwiftChatMessage = IDSwiftChatMessage(message: "Lang besked her Lang besked herLang besked herLang besked herLang besked herLang besked herLang besked herLang besked her", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c3: IDSwiftChatMessage = IDSwiftChatMessage(message: "Går det godt?", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c4: IDSwiftChatMessage = IDSwiftChatMessage(message: "Det går fint", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c5: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c6: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklmslksdmflkdsfldsmfkldfsklmdsfklmslksdmflkdsfldsmfkldfsklmdsfklmslksdmflkdsfldsmfkldfsklmdsfklmslksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c7: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c8: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c9: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c10: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c11: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c12: IDSwiftChatMessage = IDSwiftChatMessage(message: "lksdmflkdsfldsmfkldfsklmdsfklms", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            
            self.messages.append(c1)
            self.messages.append(c2)
            self.messages.append(c3)
            self.messages.append(c4)
            self.messages.append(c5)
            self.messages.append(c6)
            self.messages.append(c7)
            self.messages.append(c8)
            self.messages.append(c9)
            self.messages.append(c10)
            self.messages.append(c11)
            self.messages.append(c12)
        } else {
            let c1: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "David Buhauer", message: "Hej med dig", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c2: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "Vernon Barnes", message: "Lang besked her Lang besked herLang besked herLang besked herLang besked herLang besked herLang besked herLang besked her", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c3: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "David Buhauer", message: "Går det godt?", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c4: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "Vernon Barnes", message: "Det går fint", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c5: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "Vernon Barnes", message: "Hvad med dig?", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            let c6: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "David Buhauer", message: "Jo tak, det går også rigtig fint", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c7: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "David Buhauer", message: "Skal vi jagte?", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            let c8: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "Vernon Barnes", message: "JA!", messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: false)
            
            self.messages.append(c1)
            self.messages.append(c2)
            self.messages.append(c3)
            self.messages.append(c4)
            self.messages.append(c5)
            self.messages.append(c6)
            self.messages.append(c7)
            self.messages.append(c8)
        }
        
        self.reloadMessages(scrollAnimated: true)
    }
    
    // MARK: - IDSwiftMessageComposerViewDelegate
    override func messageComposerSendMessageClickedWithMessage(_ message: String) {
        if self.chatType == .chat {
            let c1: IDSwiftChatMessage = IDSwiftChatMessage(message: message, messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            self.messages.append(c1)
        } else {
            let c1: IDSwiftForumChatMessage = IDSwiftForumChatMessage(messageFrom: "David Buhauer", message: message, messageTimeStamp: "12345678", senderId: "0", contentImageId: "0", isOwnMessage: true)
            self.messages.append(c1)
        }
        
        self.reloadMessages(scrollAnimated: true)
    }
    
    override func cameraButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage? {
        return UIImage(named: "icon_camera.png")
    }
    
    override func locateMeButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage? {
        return UIImage(named: "icon_locate_me.png")
    }
}
