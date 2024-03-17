//
//  AppetizerListViewModel.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-10.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    //    func getAppetizers() {
    //        isLoading = true
    //        NetworkManager.shared.getAppetizers { result in
    //            DispatchQueue.main.async {
    //                self.isLoading = false
    //                switch result {
    //                case .success(let appetizer):
    //                    self.appetizers = appetizer
    //                case .failure(let error):
    //
    //                    switch error {
    //                    case .invalidRespnse:
    //                        self.alertItem = AlertContext.invalidResponse
    //
    //                    case .invalidURL:
    //                        self.alertItem = AlertContext.invalidURL
    //
    //                    case .invalidData:
    //                        self.alertItem = AlertContext.invalidData
    //
    //                    case .unableToComplete:
    //                        self.alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
    
    func getAppetizers() {
        isLoading = true
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                alertItem = AlertContext.invalidResponse
                isLoading = true
            }
        }
        
    }
}
