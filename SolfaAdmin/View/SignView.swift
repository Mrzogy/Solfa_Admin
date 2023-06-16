//
//  SignView.swift
//  SolfaCoustomer
//
//  Created by 3bood on 26/11/1444 AH.
//

import SwiftUI

struct SignView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State var  ShowAlert = false
    @Binding var shoSignInView:Bool
    var body: some View {
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task{
                    do{
                        try await viewModel.signUp()
                        shoSignInView = false
                        return
                    }catch{
                        print(error)
                        ShowAlert = true
                    }
                   //
                    do{
                        try await viewModel.signIn()
                        shoSignInView = false
                        return
                    }catch{
                        print(error)
                        ShowAlert = true
                    }
                }
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.black)
                    .cornerRadius(10)
            }
            .alert("Email OR Password Faild",isPresented: $ShowAlert) {
                Text("No")
            }
            Spacer()

//           RiveViewModel(fileName:"viking_demo").view()
//                .scaledToFit()
//                .frame(width: 300,height: 300)
//                .ignoresSafeArea()
//                .padding(.top,200)
                
        }
        .padding()
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView(shoSignInView: .constant(false))
    }
}
