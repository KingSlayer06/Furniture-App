//
//  CartProductView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 02/02/24.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 50)
                .cornerRadius(9)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(product.name)").bold()
                
                Text("$ \(product.price)").bold()
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer()
            
            HStack {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(KeyVariables.primaryColor))
                    .onTapGesture {
                        
                    }
                
                Text("2")
                    .font(.title2.bold())
                    .foregroundColor(.black)
                
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(KeyVariables.primaryColor))
                    .onTapGesture {
                        
                    }
            }
        }
        .padding(.horizontal)
        .background(Color(KeyVariables.secondaryColor))
        .cornerRadius(12)
    }
}

#Preview {
    CartProductView(product: productList[0])
        .environmentObject(CartViewModel())
}
