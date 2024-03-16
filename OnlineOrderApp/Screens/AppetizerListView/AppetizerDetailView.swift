//
//  DetailView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-12.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack (spacing: 40){
                NutritionInfor(titte: "Calories", value: appetizer.calories)
                NutritionInfor(titte: "Carbs", value: appetizer.carbs)
                NutritionInfor(titte: "Protein", value: appetizer.protein)
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add To Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
            }
            .frame(width: 250, height: 50)
            .background(Color("brandPrimary"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 40)
        // X button to dismiss the view
        .overlay(Button {
            isShowingDetailView = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}


struct NutritionInfor: View {
    
    let titte: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 5){
            Text(titte)
                .bold()
                .font(.caption)
                .padding(5)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
