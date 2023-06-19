//
//  HomeView.swift
//  SolfaAdmin
//
//  Created by 3bood on 27/11/1444 AH.
//

import SwiftUI

struct HomeView: View {
    @Binding var shoSignInView:Bool
    var body: some View {
        NavigationStack {
            TabView{
                AddStore(shoSignInView: .constant(false))
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CreatOrder(shoSignInView: .constant(false))
                    .tabItem {
                        Label("Creat Order", systemImage: "list.bullet.rectangle.portrait")
                    }
                read()
                    .tabItem {
                        Label("All Order", systemImage: "chart.bar.doc.horizontal")
                    }
                Account(shoSignInView: $shoSignInView)
                    .tabItem {
                        Label("Account", systemImage: "person.crop.circle.badge")
                    }
            }
        }
      
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(shoSignInView: .constant(false))
    }
}
