//
//  DetailView.swift
//  OnlineOrderApp
//
//  Created by Emre Yilmaz on 2024-03-12.
//

import SwiftUI

struct DetailView: View {
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
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
                VStack (spacing: 5){
                    Text("Calories")
                        .bold()
                        .font(.caption)
                        .padding(5)
                    Text("\(appetizer.calories)")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack (spacing: 5){
                    Text("Carbs")
                        .bold()
                        .font(.caption)
                        .padding(5)
                    Text("\(appetizer.carbs) g")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack (spacing: 5){
                    Text("Protein")
                        .bold()
                        .font(.caption)
                        .padding(5)
                    Text("\(appetizer.protein) g")
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
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
        .overlay(Button {
            print("dismiss")
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
    DetailView(appetizer: MockData.sampleAppetizer)
}
