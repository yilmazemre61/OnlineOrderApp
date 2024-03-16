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
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
           
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
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
