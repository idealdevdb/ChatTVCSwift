//
//  ChatTVCSwift.swift
//  ChatTVCSwift
//
//  Created by David buhauer on 11/06/2018.
//  Copyright © 2018 David buhauer. All rights reserved.
//

import UIKit

protocol ChatTVCSwiftTVCDelegate: class {
    func getNibCellName() -> String
}

enum ChatType {
    case chat
    case forum
}

class ChatTVCSwift: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    
    internal let CELL_NIB_NAME: String = String(describing: ChatCellSwift.self)
    internal let CELL_IDENTIFIER: String = String(describing: ChatCellSwift.self)
    
    weak var delegate: ChatTVCSwiftTVCDelegate?
    
    lazy var messages: [ChatMessageSwift] = [ChatMessageSwift]()
    lazy var chatType: ChatType = .chat
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(withMessage messages: [ChatMessageSwift], andChatType chatType: ChatType = .chat) {
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
        
        self.view.layoutIfNeeded()
    }
    
    func getNibCellName() -> String {
        return CELL_NIB_NAME
    }
    
    // MARK: - Tableview
    func setupChatTableView() {
        let cellNib: UINib = UINib(nibName: self.getNibCellName(), bundle: nil)
        self.chatTableView.register(cellNib, forCellReuseIdentifier: self.getNibCellName())
        self.chatTableView.dataSource = self
        self.chatTableView.delegate = self
        self.chatTableView.separatorStyle = .none
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
    
    private func messageForIndexPath(_ indexPath: IndexPath) -> ChatMessageSwift {
        return self.messages[indexPath.row]
    }
    
    private func getLastIndexPath() -> IndexPath {
        return IndexPath(row: self.messages.count - 1, section: 0)
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension ChatTVCSwift: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell_: ChatCellSwift?
        
        if let cell: ChatCellSwift = tableView.dequeueReusableCell(withIdentifier: self.getNibCellName()) as? ChatCellSwift {
            let chatMessage: ChatMessageSwift = self.messageForIndexPath(indexPath)
            cell.configCellForMessage(chatMessage)
            cell_ = cell
        }
        
        return cell_ ?? UITableViewCell()
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
