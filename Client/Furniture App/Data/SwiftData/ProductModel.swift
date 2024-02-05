//
//  ProductModel.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation
import SwiftData

@Model
class ProductModel: Identifiable {
    var id: Int
    var name: String
    var image: String
    var desc: String
    var supplier: String
    var price: Int
    var rating: Double
    var isAddedToFavourate: Bool
    
    init(id: Int, name: String, image: String, desc: String, supplier: String, price: Int, rating: Double, isAddedToFavourate: Bool) {
        self.id = id
        self.name = name
        self.image = image
        self.desc = desc
        self.supplier = supplier
        self.price = price
        self.rating = rating
        self.isAddedToFavourate = isAddedToFavourate
    }
}
