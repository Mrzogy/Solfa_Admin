//
//  Account.swift
//  SolfaAdmin
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct Account: View {
    @State var name = ""
    @State var phone = ""
    @State var Day = ""
    @ObservedObject var vm = ViewModel()
    @StateObject private var viewModel = settingsViewModel()
    @ObservedObject var vm1 = AdminViewModel()
    @Binding var shoSignInView:Bool
    var body: some View {
        VStack(spacing: 20){
            Group {
                
                VStack(alignment: .leading) {
                    Text("Name")
                    TextField("name", text: $vm1.name)
                        .textFieldStyle(.roundedBorder)
                }
                VStack(alignment: .leading) {
                    Text("phone")
                    TextField("phone", text: $vm1.phone)
                        .textFieldStyle(.roundedBorder)
                }
                VStack(alignment: .leading) {
                    Text("Email")
                    TextField("Email", text: $vm1.email)
                        .textFieldStyle(.roundedBorder)
                }

                
            }
            DatePicker(selection: .constant(vm1.gender), label: { Text("Date") })
            Picker("",selection:$vm1.isMale) {
                Text("Male").tag("Male")
                Text("Fmale").tag("Fmale")
            }
            .pickerStyle(.segmented)
            Spacer()
            Button {
                vm1.AddAccount()
            } label: {
                Text("Update")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.black)
                    .cornerRadius(10)
            }
            Button {
                Task{
                    do {
                        try viewModel.signOut()
                        shoSignInView = true
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Log out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.red)
                    .cornerRadius(10)
            }
            
        }.padding()
            .font(.subheadline)
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account(shoSignInView: .constant(false))
    }
}
