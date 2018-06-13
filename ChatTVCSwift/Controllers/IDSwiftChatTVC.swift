//
//  ChatTVCSwift.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit
import IDCommonNeedsSwift

enum IDSwiftChatType {
    case chat
    case forum
}

class IDSwiftChatTVC: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var textViewToTypeIn: IDSwiftMessageComposerView!
    @IBOutlet var messageInputContainerViewBottomConstraint: NSLayoutConstraint!
    
    internal let CELL_NIB_NAME_CHAT: String = String(describing: IDSwiftChatCell.self)
    internal let CELL_IDENTIFIER_CHAT: String = String(describing: IDSwiftChatCell.self)
    
    internal let CELL_NIB_NAME_FORUM: String = String(describing: IDSwiftForumCell.self)
    internal let CELL_IDENTIFIER_FORUM: String = String(describing: IDSwiftForumCell.self)
    
    lazy var messages: [IDSwiftChatMessage] = [IDSwiftChatMessage]()
    lazy var chatType: IDSwiftChatType = .chat
    
    lazy var showCameraButton: Bool = false
    lazy var showLocateMeButton: Bool = false
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(withMessage messages: [IDSwiftChatMessage], andChatType chatType: IDSwiftChatType = .chat) {
        self.init()
        
        self.messages = messages
        self.chatType = chatType
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupChatTableView()
        self.setupTextView()
        
        self.subscribeForKeyboardNotifications(true)
        
        self.chatTableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapDismissKeyboard)))
            
        self.view.layoutIfNeeded()
    }
    
    deinit {
        self.subscribeForKeyboardNotifications(false)
    }
    
    func getCellNibName() -> String {
        switch self.chatType {
        case .chat:
            return CELL_NIB_NAME_CHAT
            
        case .forum:
            return CELL_NIB_NAME_FORUM
        }
    }
    
    func getCellIdentifier() -> String {
        switch self.chatType {
        case .chat:
            return CELL_NIB_NAME_CHAT
            
        case .forum:
            return CELL_IDENTIFIER_FORUM
        }
    }

    @objc func handleKeyboardNotification(notification: Notification) {
        if let userInfo = notification.userInfo, let keyboardFrame: CGRect = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect {
            print(keyboardFrame)

            let isKeyboardShowing: Bool = notification.name == Notification.Name.UIKeyboardWillShow
            
            self.messageInputContainerViewBottomConstraint?.constant = isKeyboardShowing ? keyboardFrame.height : 0

            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.view.setNeedsLayout()
                self.view.layoutIfNeeded()
            }) { (_) in
            }
        }
    }
    
    // MARK: - Tableview
    func setupChatTableView() {
        let cellNib: UINib = UINib(nibName: self.getCellNibName(), bundle: nil)
        self.chatTableView?.register(cellNib, forCellReuseIdentifier: self.getCellIdentifier())
        self.chatTableView?.dataSource = self
        self.chatTableView?.delegate = self
        self.chatTableView?.separatorStyle = .none
    }
    
    func setupTextView() {
        self.textViewToTypeIn.messageTextView.clipsToBounds = true
        self.textViewToTypeIn.messageTextView.layer.backgroundColor = UIColor.white.cgColor
        self.textViewToTypeIn.messageTextView.layer.borderColor = UIColor.gray.cgColor
        self.textViewToTypeIn.messageTextView.layer.borderWidth = 1.0
        self.textViewToTypeIn.messageTextView.layer.cornerRadius = 5.0
        self.textViewToTypeIn.messageTextView.layer.masksToBounds = true
        self.textViewToTypeIn.delegate = self
        
        if self.showCameraButton {
            self.textViewToTypeIn.setupCameraInputButton()
        }
        
        if self.showLocateMeButton {
            self.textViewToTypeIn.setupLocateMeInputButton()
        }
    }
    
    final func reloadMessages(scrollAnimated: Bool) {
        if self.messages.count - 1 == self.chatTableView.numberOfRows(inSection: 0) {
            self.chatTableView.beginUpdates()
            let lastIndexPath: IndexPath = self.getLastIndexPath()
            self.chatTableView.insertRows(at: [lastIndexPath], with: .automatic)
            self.chatTableView.endUpdates()
            self.chatTableView.reloadData()
        } else {
            self.chatTableView.reloadData()
        }
        
        self.scrollToBottomAnimated(scrollAnimated)
    }
    
    final func scrollToBottomAnimated(_ animated: Bool) {
        if self.messages.count > 0 {
            let lastIndexPath: IndexPath = self.getLastIndexPath()
            if self.chatTableView.numberOfRows(inSection: 0) > lastIndexPath.row {
                self.chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: animated)
            }
        }
    }
    
    func messageForIndexPath(_ indexPath: IndexPath) -> IDSwiftChatMessage {
        return self.messages[indexPath.row]
    }
    
    private func getLastIndexPath() -> IndexPath {
        return IndexPath(row: self.messages.count - 1, section: 0)
    }
    
    private func subscribeForKeyboardNotifications(_ subscribe: Bool) {
        if subscribe {
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboardNotification(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleKeyboardNotification(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        } else {
            NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: nil)
        }
    }
    
    // MARK: - Actions
    @objc func didTapDismissKeyboard() {
        self.textViewToTypeIn.messageTextView.resignFirstResponder()
    }
    
    // MARK: - Landscape
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.chatTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension IDSwiftChatTVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell_: IDSwiftChatCell?
        
        let chatMessage: IDSwiftChatMessage = self.messageForIndexPath(indexPath)
        
        switch self.chatType {
        case .chat:
            if let cell: IDSwiftChatCell = tableView.dequeueReusableCell(withIdentifier: self.getCellIdentifier()) as? IDSwiftChatCell {
                cell_ = cell
            }
            break
            
        case .forum:
            if let cell: IDSwiftForumCell = tableView.dequeueReusableCell(withIdentifier: self.getCellIdentifier()) as? IDSwiftForumCell {
                cell_ = cell
            }
            
            break
        }
        
        cell_?.configCellForMessage(chatMessage)

        return cell_ ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        UIView.performWithoutAnimation {
            cell.layoutIfNeeded()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53
    }
}

extension IDSwiftChatTVC: IDSwiftMessageComposerViewDelegate {
    func messageComposerSendMessageClickedWithMessage(_ message: String) {
        
    }
    
    func cameraButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage? {
        return nil
    }
    
    func cameraButtonPressed() {
        
    }
    
    func locateMeButtonImage(_ sender: IDSwiftMessageComposerView) -> UIImage? {
        return nil
    }
    
    func locateMeButtonPressed() {
        
    }
}
