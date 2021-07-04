//
//  ChatViewController.swift
//  Messenger
//
//  Created by Юлия Караневская on 28.06.21.
//

import UIKit
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var pictureURL: String
    var senderId: String
    var displayName: String
}

class ChatViewController: MessagesViewController {
    
    private var messages = [Message]()
    
    private let selfSender = Sender(pictureURL: "", senderId: "1", displayName: "Helga")
    private let anotherSender = Sender(pictureURL: "", senderId: "2", displayName: "Tom")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello my friend!")))
        messages.append(Message(sender: anotherSender, messageId: "2", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: selfSender, messageId: "3", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: anotherSender, messageId: "4", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: selfSender, messageId: "5", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: anotherSender, messageId: "6", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: selfSender, messageId: "7", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
        messages.append(Message(sender: anotherSender, messageId: "8", sentDate: Date(), kind: .text("Hello my friend! How are you doing? What's new? Where are you now?")))
    }
    
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        messages.count
    }
    
    
}
