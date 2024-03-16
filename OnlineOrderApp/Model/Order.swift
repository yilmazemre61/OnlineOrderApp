//
//  Order.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-16.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
}
