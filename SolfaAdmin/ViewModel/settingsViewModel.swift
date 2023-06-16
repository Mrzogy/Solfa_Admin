//
//  settingsViewModel.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import Foundation
@MainActor
final class settingsViewModel: ObservableObject {
    
    func signOut() throws{
        try AuthinticationManager.shared.SignOut()
    }
    func resetPassword() async throws {
        let authUser = try AuthinticationManager.shared.getAuthinticationUser()
        
        guard let email = authUser.email else{
            throw URLError(.fileDoesNotExist)
        }
       try await AuthinticationManager.shared.resetPassword(email: email)
    }
    func updateEmail() async throws {
        let email = "A@gmail.com"
        try await AuthinticationManager.shared.UpdateEmail(email: email)
    }
    func updatePassword() async throws {
        let password = "123456"
        try await AuthinticationManager.shared.UpdatePassword(password: password)
    }
}

