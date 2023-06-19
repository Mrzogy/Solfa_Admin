//
//  LoginScreenView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct LoginScreenView: View {
    @State private var showSignInView: Bool = false
    @ObservedObject var vm = ViewModel()
    @StateObject private var viewModel = settingsViewModel()
    @ObservedObject var vm1 = AdminViewModel()
    var body: some View {
        ZStack{
            NavigationView{
               // ProfileView(showSignInView: $showSignInView)
              //  ContentView(showsSignView: $showSignInView)
               // Account(shoSignInView: $showSignInView)
               // AddStore(shoSignInView: $showSignInView)
               // CreatOrder(shoSignInView: $showSignInView)
                //Account(showsSignView: $showSignInView)
                //TabViews()
                HomeView(shoSignInView: $showSignInView)
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
        }.navigationBarBackButtonHidden(true)
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
