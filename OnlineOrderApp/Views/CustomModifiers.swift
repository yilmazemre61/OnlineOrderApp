//
//  CustomModifiers.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-16.
//

import SwiftUI

struct StandardButtomStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
