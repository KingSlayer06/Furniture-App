//
//  AllProductsView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import SwiftUI

struct AllProductsView: View {
    
    let column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("All Furnitures")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            LazyVGrid(columns: column, spacing: 20) {
                ForEach(productList, id: \.id) { product in
                    ProductCardView(product: product)
                }
            }
        }
    }
}

#Preview {
    AllProductsView()
        .environmentObject(CartViewModel())
}
