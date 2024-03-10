//
//  ContentView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-02-28.
//

import SwiftUI

struct AppetizerTapView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTapView()
}
