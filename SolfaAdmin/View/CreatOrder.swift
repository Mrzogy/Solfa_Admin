//
//  CreatOrder.swift
//  SolfaAdmin
//
//  Created by 3bood on 28/11/1444 AH.
//

import SwiftUI

struct CreatOrder: View {
    @StateObject private var vm = Order()
    @StateObject private var viewModel = settingsViewModel()
    @ObservedObject var vm1 = AdminViewModel()
   // @ObservedObject var vm2 = ordersread()
    @Binding var shoSignInView:Bool
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group {
                        VStack(alignment: .leading) {
                            Text("Person Name")
                            TextField("Person Name...", text: $vm.name)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                                .keyboardType(.default)
                        }
                        VStack(alignment: .leading) {
                            Text("Id Number")
                            TextField("Id Number...", text: $vm.IdNumber)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                                .keyboardType(.asciiCapableNumberPad)
                        }
                        VStack(alignment: .leading) {
                            Text("Person phone")
                            TextField("phone...", text: $vm.phone)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                                .keyboardType(.asciiCapableNumberPad)
                        }
                       
                        VStack(alignment: .leading) {
                            Text("prudoct")
                            TextField("prudoct...", text: $vm.prudoct,axis: .vertical)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text("Price")
                            TextField("Price...", text: $vm.price)
                                .padding()
                                .background(Color.gray.opacity(0.4))
                                .cornerRadius(10)
                                .keyboardType(.asciiCapableNumberPad)
                        }
                    }
                    Spacer()
                        .padding()
                    Button {
                        vm.AddOrderId()
                       
                    } label: {
                        Text("Save Order")
                            .font(.headline)
                            .foregroundColor(Color("Color 1"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color("Color"))
                            .cornerRadius(10)
                    }
                }.padding()
            }
        }
    }
}
struct CreatOrder_Previews: PreviewProvider {
    static var previews: some View {
        CreatOrder(shoSignInView: .constant(false))
    }
}
