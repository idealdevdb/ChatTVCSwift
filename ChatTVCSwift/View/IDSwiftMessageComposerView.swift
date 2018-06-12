//
//  IDSwiftMessageComposerView.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 12/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit
import IDCommonNeeds

class IDSwiftMessageComposerView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var messageTextView: IDTextView!
    @IBOutlet var sendButton: UIButton!
    
    // For using CustomView in code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    // For using CustomView in IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        // We're going to do stuff here
        Bundle.main.loadNibNamed(String(describing: IDSwiftMessageComposerView.self), owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @IBAction func didTapSendButton(_ sender: UIButton) {
        
    }
}
