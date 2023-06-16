//
//  AdminViewModel.swift
//  SolfaAdmin
//
//  Created by 3bood on 27/11/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class AdminViewModel: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var name = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var gender = Date()
    @Published var isMale = ""
    
    func AddAccount()  {
        
        let docData: [String: Any] = [
            "name": name,
            "phone": phone,
            "email": email,
            "gender": gender,
            "isMale": isMale
                    ]
        
        db.collection("Account_Admin_informition").document(Auth.auth().currentUser?.uid ?? "").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}

class Store: ObservableObject {
    @Published var Storename = ""
    @Published var StoreTitle = ""
    @Published var StoreType = ""
    
    
    let db = Firestore.firestore()
    
    func fetch() {
        let docData: [String: Any] = [
            "Storename": Storename,
            "StoreType": StoreType,
            "StoreTitle": StoreTitle
                    ]
        
        db.collection("Store").document(Auth.auth().currentUser?.uid ?? "").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }

    }
    
}
