//
//  StgramUser.swift
//  Pursuitstgram-Firebase-Project
//
//  Created by Eric Widjaja on 11/24/19.
//  Copyright © 2019 Eric.W. All rights reserved.
import Foundation
import FirebaseFirestore
import FirebaseAuth

struct StgramUser {
    let email: String?
    let uid: String
    let userName: String?
    let dateCreated: Date?
    
    init(from user: User) {
        self.userName = user.displayName
        self.email = user.email
        self.uid = user.uid
        self.dateCreated = user.metadata.creationDate
    }
    
    init?(from dict: [String: Any], id: String) {
        guard let userName = dict["userName"] as? String,
            let email = dict["email"] as? String,
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue() else { return nil }
        
        self.userName = userName
        self.email = email
        self.uid = id
        self.dateCreated = dateCreated
    }
    
    var fieldsDict: [String: Any] {
        return [
            "userName": self.userName ?? "",
            "email": self.email ?? ""
        ]
    }
}
