//
//  SignInEmailViewModel.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import Foundation
@MainActor
final class SignInEmailViewModel: ObservableObject {
   @Published var email = ""
   @Published var password = ""
    
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found")
            return
        }
      let authDataResault = try await AuthinticationManager.shared.creatUser(email: email, password: password)
        
        try await UserManager.shared.creatNewUser(auth: authDataResault)
    }
    
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("no email or password found")
            return
        }
       try await AuthinticationManager.shared.SignInUser(email: email, password: password)
        
        
    }
}
