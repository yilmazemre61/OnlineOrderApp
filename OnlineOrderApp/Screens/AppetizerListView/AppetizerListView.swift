//
//  ApetizerListView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-04.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack{
                List(viewModel.appetizers) {appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
    
}

#Preview {
    AppetizerListView()
}
