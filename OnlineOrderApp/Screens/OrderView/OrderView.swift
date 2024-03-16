//
//  OrderView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-04.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .frame(width: 260, height: 50)
//                            .foregroundStyle(.white)
                    }
                    .modifier(StandardButtomStyle())
//                    .frame(width: 250, height: 50)
//                    .background(Color("brandPrimary"))
//                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom,25)
                }
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order-image", message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("💼 Order")
        }
    }
    
}

#Preview {
    OrderView()
}
