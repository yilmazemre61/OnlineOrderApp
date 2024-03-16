//
//  ContentView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-02-28.
//

import SwiftUI

struct AppetizerTapView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")        
                }
                .badge(order.items.count)
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTapView()
}
