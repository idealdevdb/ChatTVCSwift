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
    
    @IBOutlet var imgMessage: IDAutoFetchImageView!
    @IBOutlet var imgFrom: IDAutoFetchImageView!
    @IBOutlet var profileContainer: UIView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var txtMessage: IDChatLabel!
    @IBOutlet var viewBackground: UIView!
    @IBOutlet var textMessageLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var profileContainerLeadingConstraint: NSLayoutConstraint!
    
    var timeStampAttributes: [NSAttributedStringKey: Any]?
    var messageAttributes: [NSAttributedStringKey: Any]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        self.txtMessage?.lineBreakMode = .byWordWrapping
        self.txtMessage?.numberOfLines = 0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.imgFrom?.cancelImageDownload()
        self.imgFrom?.image = nil
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
        
        self.viewBackground?.backgroundColor = message.isOwnMessage ? UIColor.blue : UIColor.green
        self.imgFrom?.image = message.isOwnMessage ? UIImage(named: "person1.png") : UIImage(named: "person2.png")
        
        self.setupLayoutForMessage(message)
    }
    
    func setupLayoutForMessage(_ message: IDSwiftChatMessage) {
        if message.isOwnMessage {
            self.textMessageLeadingConstraint?.isActive = false
            self.profileContainerLeadingConstraint?.isActive = false
        } else {
            self.textMessageLeadingConstraint?.isActive = true
            self.profileContainerLeadingConstraint?.isActive = true
        }
        
        self.layoutIfNeeded()
    }
}
