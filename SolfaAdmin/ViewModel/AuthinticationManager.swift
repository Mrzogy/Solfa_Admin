//
//  AuthinticationManager.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//


import Foundation
import FirebaseAuth

struct AuthDataResaultModel{
    let uid: String
    let email: String?
    let photourl: String?
    let isSignIn: Bool
    init(user:User){
        self.uid = user.uid
        self.email = user.email
        self.photourl = user.photoURL?.absoluteString
        self.isSignIn = user.isAnonymous
    }
}
final class AuthinticationManager {
    static let shared = AuthinticationManager()
    private init() {}
    
    func getAuthinticationUser() throws -> AuthDataResaultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResaultModel(user: user)
    }

    
    func SignOut() throws {
       try  Auth.auth().signOut()
    }
    

}

extension AuthinticationManager {
    
    @discardableResult
    func creatUser(email:String, password: String) async throws -> AuthDataResaultModel{
       let authDataResault = try await Auth.auth().createUser(withEmail: email, password: password)
        return  AuthDataResaultModel(user: authDataResault.user)
    }
    
    @discardableResult
    func SignInUser(email:String, password: String) async throws -> AuthDataResaultModel {
        let authDataResault = try await Auth.auth().signIn(withEmail: email, password: password)
        return  AuthDataResaultModel(user: authDataResault.user)
    }
    func resetPassword(email:String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func UpdatePassword(password: String) async throws{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updatePassword(to: password)
    }
    func UpdateEmail(email: String) async throws{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        try await user.updateEmail(to: email)
    }
}

extension AuthinticationManager {
    @discardableResult
//    func signInWithGoogle(tokens:GoogleSignInResaultModel) async throws -> AuthDataResaultModel {
//        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
//        return try await signIn(credential: credential)
//    }
   
    func signIn(credential: AuthCredential) async throws -> AuthDataResaultModel {
        let authDataResault = try await Auth.auth().signIn(with: credential)
        return  AuthDataResaultModel(user: authDataResault.user)
    }
}

