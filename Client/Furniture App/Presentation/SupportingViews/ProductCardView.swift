//
//  ProductCardView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 02/02/24.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State var isAddedToCart: Bool = false
    var product: Product
    
    var body: some View {
        ZStack {
            Color(KeyVariables.secondaryColor)
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)
                    
                    Text(product.name)
                        .foregroundColor(.black)
                        .font(.headline)
                        .padding(.vertical, 1)
                    
                    Text(product.supplier)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.vertical, 0.5)
                    
                    Text("$ \(product.price)")
                        .foregroundColor(.black)
                        .bold()
                }
                
                Button {
                    cartViewModel.addToCart(product: product) {
                        isAddedToCart = cartViewModel.products.contains(where: { $0.id == product.id })
                    }
                } label: {
                    Image(systemName: isAddedToCart ? "checkmark.circle.fill" : "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color(KeyVariables.primaryColor))
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }
                .disabled(isAddedToCart)
                .onAppear {
                    isAddedToCart = cartViewModel.products.contains(where: { $0.id == product.id })
                }
            }
        }
        .frame(width: 185, height: 260)
        .cornerRadius(15)
    }
}

#Preview {
    ProductCardView(product: productList[0])
        .environmentObject(CartViewModel())
}
