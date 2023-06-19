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


class Order: ObservableObject {
    @Published var name = ""
    @Published var IdNumber = ""
    @Published var phone = ""
    @Published var price = ""
    @Published var prudoct = ""
    
    
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil
    
    func AddOrder()  {
        
        let docData: [String: Any] = [
            "name": name,
            "Id_Number": IdNumber,
            "phone": phone,
            "price": price,
            "prudoct": prudoct
                    ]
        
        db.collection(Auth.auth().currentUser?.uid ?? "").document("orders").setData(docData) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func AddOrderId() {
          
            ref = db.collection("Orders").addDocument(data: [
                "name": name,
                "Id_Number": IdNumber,
                "phone" : phone,
                "price" : price,
                "prudoct" : prudoct
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(self.ref!.documentID)")
                }
            }
        
    }
    
}

struct Order10: Identifiable {
    var id:String = UUID().uuidString
    var name:String
    var IdNumber:String
    var phone:String
    var price:String
    var prudoct:String
}
class Orders : ObservableObject {
    @Published var order = [Order10]()
    let db = Firestore.firestore()
    func readOrder() {
            db.collection("Orders").addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.order = documents.map { (queryDocumentSnapshot) -> Order10 in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    let IdNumber = data["Id_Number"] as? String ?? ""
                    let phone = data["phone"] as? String ?? ""
                    let price = data["price"] as? String ?? ""
                    let prudoct = data["prudoct"] as? String ?? ""
                    
                    return Order10(name: name, IdNumber: IdNumber, phone: phone, price: price, prudoct: prudoct)
                }
            }
        
    }
}
