//
//  OnlineOrderAppApp.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-02-28.
//

import SwiftUI

@main
struct OnlineOrderAppApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTapView().environmentObject(order)
        }
    }
}
