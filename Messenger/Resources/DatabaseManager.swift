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
    
    
}

//MARK: - Account management

extension DatabaseManager {
    
    //return true if user is new, return false if user exists
    public func validateNewUser(by email: String, completion: @escaping ((Bool) -> Void)) {
        database.child(email).observeSingleEvent(of: .value) { dataSnapshot in
            guard dataSnapshot.value as? String != nil else {
                completion(false)
                return
            }
            completion(true)
        }
        
    }
    
    
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
