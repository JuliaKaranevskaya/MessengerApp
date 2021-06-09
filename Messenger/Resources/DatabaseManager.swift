//
//  DatabaseManager.swift
//  Messenger
//
//  Created by Юлия Караневская on 22.05.21.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func addUser(with user: MessengerUser) {
        database.child(user.email).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
    
    
}

struct MessengerUser {
    let firstName: String
    let lastName: String
    let email: String
//    let profilePictureUrl: String
}
