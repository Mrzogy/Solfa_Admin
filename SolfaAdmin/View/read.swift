//
//  read.swift
//  SolfaAdmin
//
//  Created by 3bood on 28/11/1444 AH.
//

import SwiftUI

struct read: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
  @ObservedObject var vm = Orders()
    var body: some View {
        ScrollView {
            VStack{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.order) { i in
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Color 2"))
                            .frame(width: 170, height: 170)
                            .cornerRadius(10)
                            .foregroundColor(.primary)
                            .shadow(radius: 10)
                            
                            VStack(spacing: 10){
                                Text(i.name)
                                    .foregroundColor(.black)
                                    .bold()
                                Text(i.IdNumber)
                                    .foregroundColor(.white)
                                Text(i.phone)
                                    .foregroundColor(.white)
                                Text(i.prudoct)
                                    .font(.footnote)
                                Text(i.price)
                                    .bold()
                                Spacer()
                            }.padding()
                            
                        }
                    }
                }
            }.padding(5)
                .onAppear() {
                   self.vm.readOrder()
            }
        }
        
    }
}

struct read_Previews: PreviewProvider {
    static var previews: some View {
        read()
    }
}
