//
//  Onbarding2.swift
//  SolfaCoustomer
//
//  Created by 3bood on 01/12/1444 AH.
//

import SwiftUI

struct Onbarding2: View {
    var Texts = ["A","A","A"]
    @State var Title = "Solfa App"
    @State var Title1 = """
Solfa application solves the problem of stores that still collect debts in paper books. Solfa application helps them solve this problem
"""
    @State var Title2 = ""
    var body: some View {
        
        NavigationView {
            VStack {
                TabView {
                    ForEach(1..<2) { index in
                        VStack(alignment: .leading,spacing: 30) {
                            Image("Store")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                            Text(Title)
                                .font(.title2)
                                .bold()
                                Text(Title1)
                                    .font(.callout)
                                .fontWeight(.light)
                               
                            
                            

                            Spacer()
                           
                        }.padding()
                        
                    }
                    
                }
                .tabViewStyle(.page)
           
                HStack(spacing: 150) {
                    NavigationLink(destination: LoginScreenView()) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(Color("Color 1"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(Color("Color"))
                            .cornerRadius(10)
                    }.navigationBarBackButtonHidden(true)
                        .padding()
                }
            }
        }
       
    }
}

struct Onbarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onbarding2()
    }
}
