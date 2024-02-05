//
//  CartView.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            if !cartViewModel.products.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(cartViewModel.products, id: \.id) { product in
                        CartProductView(product: product)
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Total Payment")
                            .font(.title2.bold())
                        
                        Spacer()
                        
                        Text("$ \(cartViewModel.total)")
                            .font(.title2.bold())
                            .foregroundColor(Color("yellow"))
                    }
                    
                    checkoutButton
                }
            } else {
                emptyCartView
            }
        }
        .padding(.horizontal)
    }
}

extension CartView {
    var emptyCartView: some View {
        VStack {
            Image(systemName: "cart.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(KeyVariables.primaryColor))
            
            Text("Your Cart Is Empty")
                .font(.title2.bold())
                .padding()
            
            Text("Looks like you haven't made your choice yet...")
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Button {
                homeViewModel.selectedTab = .home
            } label: {
                Text("Go Home")
                    .font(.headline.bold())
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                    .foregroundColor(.white)
                    .background(Color(KeyVariables.primaryColor))
                    .cornerRadius(12)
                    .padding(.top, 50)
            }
        }
    }
    
    var checkoutButton: some View {
        Button {
            cartViewModel.checkOut {
                
            }
        } label: {
            Text("Checkout Now")
                .font(.headline.bold())
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .padding(.vertical, 20)
                .foregroundColor(.white)
                .background(Color(KeyVariables.primaryColor))
                .cornerRadius(12)
                .padding(.top)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(HomeViewModel())
        .environmentObject(CartViewModel())
}
