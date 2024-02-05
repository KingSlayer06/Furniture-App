//
//  ProductDetailsView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product: Product
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: 300)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .padding(.top, 63)
                        .padding(.trailing, 20)
                        .foregroundColor(product.isAddedToFavourate ? .red : .white)
                        .onTapGesture {
                            Haptics.shared.play(.light)
                        }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(product.name)
                            .font(.title2.bold())
                        
                        Spacer()
                        
                        Text("$ \(product.price)")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding(.top)
                    
                    HStack(spacing: 10) {
                        ForEach(0..<Int(product.rating)) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                        }
                        
                        ForEach(0..<5-Int(product.rating)) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                        
                        Text("(\(String(format: "%.1f", product.rating)))")
                            .font(.headline)
                    }
                    .padding(.vertical)
                    
                    Text("Description")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Text(product.description)
                }
                .padding(.horizontal)
            }
        }
        .overlay(alignment: .bottom) {
            Button {
                cartViewModel.addToCart(product: product) {
                    
                }
            } label: {
                Text("Add To Cart")
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                    .background(Color(KeyVariables.primaryColor))
                    .cornerRadius(12)
                    .padding(.top)
            }
            .padding(.horizontal)
            .padding(.bottom, 35)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProductDetailsView(product: productList[0])
        .environmentObject(CartViewModel())
}
