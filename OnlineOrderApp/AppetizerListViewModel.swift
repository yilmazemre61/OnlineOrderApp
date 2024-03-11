//
//  AppetizerListViewModel.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-10.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizer):
                    self.appetizers = appetizer
                case .failure(let error):
                    
                    switch error {
                    case .invalidRespnse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }   
        }
    }
}
