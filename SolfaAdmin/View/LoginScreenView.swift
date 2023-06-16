//
//  LoginScreenView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct LoginScreenView: View {
    @State private var showSignInView: Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
               // ProfileView(showSignInView: $showSignInView)
              //  ContentView(showsSignView: $showSignInView)
                //Account(shoSignInView: .constant(false))
                AddStore(shoSignInView: $showSignInView)
                //Account(showsSignView: $showSignInView)
                //TabViews()
            }
            .onAppear {
                let authuser = try? AuthinticationManager.shared.getAuthinticationUser()
                self.showSignInView = authuser == nil ? true : false
            }
            .fullScreenCover(isPresented: $showSignInView) {
                NavigationStack{
                    SignView(shoSignInView: $showSignInView)
                }
            }
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
