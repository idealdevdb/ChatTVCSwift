//
//  IDSwiftMessageComposerView.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 12/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit
import IDCommonNeeds

@objc protocol IDSwiftMessageComposerViewDelegate : class {
    func messageComposerSendMessageClickedWithMessage(_ message: String)
    func cameraButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage?
    func cameraButtonPressed()
    func locateMeButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage?
    func locateMeButtonPressed()
}

class IDSwiftMessageComposerView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var messageTextView: IDTextView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var inputStackView: UIStackView!
    
    weak var delegate: IDSwiftMessageComposerViewDelegate?
    
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
    
    func setupCameraInputButton() {
        if let delegate_ = self.delegate, let image = delegate_.cameraButtonImage(self) {
            let action = #selector(self.didTapCameraButton)
            self.addInputButtonWithImage(image, andAction: action)
        }
    }
    
    func setupLocateMeInputButton() {
        if let delegate_ = self.delegate, let image = delegate_.locateMeButtonImage(self) {
            let action = #selector(self.didTapLocateMeButton)
            self.addInputButtonWithImage(image, andAction: action)
        }
    }
    
    func addInputButtonWithImage(_ image: UIImage?, andAction action: Selector?) {
        let container: UIView = UIView()
        container.backgroundColor = .clear
        
        let button: UIButton = UIButton(type: .custom)
        
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        
        if let action_: Selector = action {
            button.addTarget(self, action: action_, for: .touchUpInside)
        }
        
        container.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.inputStackView?.addArrangedSubview(container)
        container.snp.makeConstraints { (make) in
            make.width.equalTo(39)
        }
    }
    
    // MARK: Actions
    @objc func didTapCameraButton() {
        self.delegate?.cameraButtonPressed()
    }
    
    @objc func didTapLocateMeButton() {
        self.delegate?.locateMeButtonPressed()
    }
    
    @IBAction func didTapSendButton(_ sender: UIButton) {
        if let text_: String = self.messageTextView?.text {
            self.messageTextView.text = ""
            self.delegate?.messageComposerSendMessageClickedWithMessage(text_)
        }
    }
}
