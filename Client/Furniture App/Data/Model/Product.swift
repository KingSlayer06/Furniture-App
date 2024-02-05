//
//  Product.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import Foundation

struct Product: Identifiable, Codable {
    var id: Int
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    var rating: Double
    var isAddedToFavourate: Bool
    
    init(id: Int, name: String, image: String, description: String, supplier: String, price: Int, rating: Double, isAddedToFavourate: Bool) {
        self.id = id
        self.name = name
        self.image = image
        self.description = description
        self.supplier = supplier
        self.price = price
        self.rating = rating
        self.isAddedToFavourate = isAddedToFavourate
    }
}

var productList: [Product] = [
    Product(
        id: 1,
        name: "Coloured chair",
        image: "furniture-1",
        description: "Two Assorted-color Padded Chairs Near Side Table",
        supplier: "IKEA",
        price: 399,
        rating: 4.5,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 2,
        name: "Dark wooden shelf",
        image: "furniture-2",
        description: "",
        supplier: "IKEA",
        price: 379,
        rating: 5,
        isAddedToFavourate: true
    ),
    
    Product(
        id: 3,
        name: "Light 2ooden shelf",
        image: "furniture-3",
        description: "",
        supplier: "IKEA",
        price: 349,
        rating: 4.2,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 4,
        name: "Black fabric sofa",
        image: "furniture-4",
        description: "",
        supplier: "IKEA",
        price: 499,
        rating: 3.6,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 5,
        name: "White fabric sofa",
        image: "furniture-5",
        description: "",
        supplier: "IKEA",
        price: 449,
        rating: 4.7,
        isAddedToFavourate: true
    ),
    
    Product(
        id: 6,
        name: "White fabric sofa",
        image: "furniture-5",
        description: "",
        supplier: "IKEA",
        price: 449,
        rating: 3.2,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 7,
        name: "Wooden bed",
        image: "furniture-6",
        description: "",
        supplier: "IKEA",
        price: 529,
        rating: 2.4,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 8,
        name: "Brown leather couch",
        image: "furniture-7",
        description: "",
        supplier: "IKEA",
        price: 339,
        rating: 4.5,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 9,
        name: "White fabric sofa",
        image: "furniture-8",
        description: "",
        supplier: "IKEA",
        price: 449,
        rating: 3.6,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 10,
        name: "Grey fabric couch",
        image: "furniture-9",
        description: "",
        supplier: "IKEA",
        price: 349,
        rating: 2.7,
        isAddedToFavourate: false
    ),
    
    Product(
        id: 11,
        name: "Purple armchair",
        image: "furniture-10",
        description: "",
        supplier: "IKEA",
        price: 329,
        rating: 5,
        isAddedToFavourate: true
    ),
]

var carouselList: [Product] = Array(productList.prefix(5))
