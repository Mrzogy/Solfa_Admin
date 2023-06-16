//
//  UserManager.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import Foundation
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBuser {
    let userId : String
    let isSignin : Bool?
    let email : String?
    let Photourl : String?
    let dateCreated : Date?
}
final class UserManager {
    
    static let shared = UserManager()
    private init() { }
    func creatNewUser(auth: AuthDataResaultModel) async throws{
        var userData: [String: Any] = [
        
            "user_id" : auth.uid,
            "is_signin" : auth.isSignIn,
            "date_created": Timestamp(),
    
        ]
        if let email = auth.email {
            userData["email"] = email
        }
        
        if let Photourl = auth.photourl {
            userData["Photo_url"] = Photourl
        }
       try await Firestore.firestore().collection("users_Admin").document(auth.uid).setData(userData, merge: false)
    }
    
    func getUser(userId: String) async throws -> DBuser {
        let snapshot =  try await Firestore.firestore().collection("users_Admin").document(userId).getDocument()
        
        guard let data = snapshot.data(),  let userId = data["user_id"] as? String else {
            throw URLError(.badServerResponse)
        }
       
        let isSignin = data["is_signin"] as? Bool
        let email = data["email"] as? String
        let Photourl = data["Photo_url"] as? String
        let dateCreated = data["date_created"] as? Date
        
        return DBuser(userId: userId, isSignin: isSignin, email: email, Photourl: Photourl, dateCreated: dateCreated)
    }
}
