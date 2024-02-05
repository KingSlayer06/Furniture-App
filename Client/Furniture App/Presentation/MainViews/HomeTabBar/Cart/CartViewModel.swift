//
//  CartViewModel.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import Foundation
import SwiftData

class CartViewModel: ObservableObject {
    @Published private (set) var products: [Product] = []
    @Published private (set) var total: Int = 0
    
    @Published var modelContext: ModelContext?
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
    }
    
    func addToCart(product: Product, completion: @escaping () -> Void) {
        if products.contains(where: { $0.id == product.id }) {
            return
        }
        
        products.append(product)
        total += product.price
        
        let productModel = ProductModel(name: product.name,
                                        image: product.image,
                                        desc: product.desc,
                                        supplier: product.supplier,
                                        price: product.price,
                                        rating: product.rating,
                                        isAddedToFavourate: product.isAddedToFavourate)
        
        modelContext?.insert(productModel)
        
        completion()
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
        
        try? modelContext?.delete(model: ProductModel.self)
        
        for _product in products {
            let productModel = ProductModel(name: _product.name,
                                            image: _product.image,
                                            desc: _product.desc,
                                            supplier: _product.supplier,
                                            price: _product.price,
                                            rating: _product.rating,
                                            isAddedToFavourate: _product.isAddedToFavourate)
            
            modelContext?.insert(productModel)
        }
    }
    
    func checkOut(completion: @escaping () -> Void) {
        
        products.removeAll()
        try? modelContext?.delete(model: ProductModel.self)

        completion()
    }
    
    func syncCart(cartItems: [ProductModel]) {
        products.removeAll()
        total = 0
        
        for item in cartItems {
            let product = Product(name: item.name,
                                  image: item.image,
                                  desc: item.desc,
                                  supplier: item.supplier,
                                  price: item.price,
                                  rating: item.rating,
                                  isAddedToFavourate: item.isAddedToFavourate)
            
            self.products.append(product)
            
            total += item.price
        }
    }
}
