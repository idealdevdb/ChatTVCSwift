//
//  ChatCellSwift.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit
import IDCommonNeeds

class IDSwiftChatCell: UITableViewCell {
    
    @IBOutlet var bubbleImageView: IDAutoFetchImageView!
    @IBOutlet var profileImageView: IDAutoFetchImageView!
    @IBOutlet var profileContainer: UIView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var txtMessage: IDChatLabel!
    @IBOutlet var textMessageProfileLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var textMessageSuperViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var profileContainerSuperViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var profileContainerSuperViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var profileContainerTextMessageTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet var textMessageSuperViewLeadingConstraint: NSLayoutConstraint!
    var timeStampAttributes: [NSAttributedStringKey: Any]?
    var messageAttributes: [NSAttributedStringKey: Any]?
    
    let profileImageLocalUser: UIImage? = UIImage(named: "person1.png")
    let profileImageRemoteUser: UIImage? = UIImage(named: "person2.png")
    
    let bubbleImageLocalUser: UIImage? = UIImage(named: "chat_bubble_green")
    let bubbleImageRemoteUser: UIImage? = UIImage(named: "chat_bubble_grey")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        self.txtMessage?.lineBreakMode = .byWordWrapping
        self.txtMessage?.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.profileImageView?.cancelImageDownload()
        self.profileImageView?.image = nil
        
        self.activiateConstraintForOwner(false)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellForMessage(_ message: IDSwiftChatMessage) {
        if let messageAttributes_: [NSAttributedStringKey: Any] = self.messageAttributes {
            self.txtMessage?.attributedText = NSAttributedString(string: message.message, attributes: messageAttributes_)
        } else {
            self.txtMessage?.text = message.message
        }
        
        if let timeStampAttributes_: [NSAttributedStringKey: Any] = self.messageAttributes {
            self.lblDate?.attributedText = NSAttributedString(string: message.messageTimeStamp, attributes: timeStampAttributes_)
        } else {
            self.lblDate?.text = message.messageTimeStamp
        }
        
        self.profileImageView?.image = message.isOwnMessage ? self.profileImageLocalUser : self.profileImageRemoteUser
        
        self.setupLayoutForMessage(message)
    }
    
    func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        
        var bubbleImage: UIImage?
        
        if message.isOwnMessage {
            self.activiateConstraintForOwner(true)
            
            bubbleImage = self.bubbleImageLocalUser
            
        } else {
            self.activiateConstraintForOwner(false)

            bubbleImage = self.bubbleImageRemoteUser
        }
        
        if let bubbleImage_: UIImage = bubbleImage {
            self.bubbleImageView?.layoutIfNeeded()
            self.bubbleImageView?.image = bubbleImage_.resizableImage(withCapInsets: UIEdgeInsets(top: bubbleImage_.size.height / 2, left: (bubbleImage_.size.width / 2) - 1, bottom: (bubbleImage_.size.height / 2), right: (bubbleImage_.size.width / 2)))
        }
        
        self.layoutIfNeeded()
    }
    
    private func activiateConstraintForOwner(_ activiate: Bool) {
        self.profileContainerSuperViewLeadingConstraint?.isActive = !activiate
        self.profileContainerSuperViewTrailingConstraint?.isActive = activiate
        
        self.textMessageSuperViewLeadingConstraint?.isActive = activiate
        self.textMessageSuperViewTrailingConstraint?.isActive = !activiate
        
        self.textMessageProfileLeadingConstraint?.isActive = !activiate
        
        self.profileContainerTextMessageTrailingConstraint?.isActive = activiate
    }
}
