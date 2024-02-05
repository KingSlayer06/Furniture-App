//
//  AllProductsView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import SwiftUI

struct AllFurnituresView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    let column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text("All Furnitures")
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(homeViewModel.products, id: \.id) { product in
                        NavigationLink {
                            ProductDetailsView(product: product)
                        } label: {
                            ProductCardView(product: product)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AllFurnituresView()
        .environmentObject(CartViewModel())
}
