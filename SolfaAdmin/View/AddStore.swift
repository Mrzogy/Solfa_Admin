//
//  AddStore.swift
//  SolfaAdmin
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct AddStore: View {
    @ObservedObject var store = Store()
    @State var showPopover = false
     let SuperMarket = "SuperMarket"
     let Coffee = "Coffee"
     let Resturant = "Resturant"
    @Binding var shoSignInView:Bool
    var body: some View {
        VStack {
            Text("Hello, World!")
            Button {
                self.showPopover = true
            } label: {
                Text("Add New Store")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(.black)
                    .cornerRadius(10)
            }.popover(isPresented: $showPopover,arrowEdge: .top) {
                VStack(spacing: 20){
                    Group {
                        
                        VStack(alignment: .leading) {
                            Text("Store Name")
                            TextField("Store Name", text: $store.Storename)
                                .textFieldStyle(.roundedBorder)
                        }
                        VStack(alignment: .leading) {
                            Text("Store Title")
                            TextField("Store Title", text:$store.StoreTitle)
                                .textFieldStyle(.roundedBorder)
                        }
//                        VStack(alignment: .leading) {
//                            Text("Email")
//                            TextField("Email", text: $store.StoreType)
//                                .textFieldStyle(.roundedBorder)
//                        }
                        Picker("",selection:$store.StoreType) {
                            Text("Super Market").tag(SuperMarket)
                            Text("Coffee").tag(Coffee)
                            Text("Resturant").tag(Resturant)
                        }.pickerStyle(.segmented)

                        
                    }
                    Spacer()
                    Button {
                        store.fetch()
                    } label: {
                        Text("Update")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(.black)
                            .cornerRadius(10)
                    }
                
                    
                }.padding()
            }
        }.padding()
        
    }
}

struct AddStore_Previews: PreviewProvider {
    static var previews: some View {
        AddStore(shoSignInView: .constant(false))
    }
}
