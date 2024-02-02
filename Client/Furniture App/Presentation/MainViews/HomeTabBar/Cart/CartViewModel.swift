//
//  CartViewModel.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published private (set) var products: [Product] = []
    @Published private (set) var total: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
}
