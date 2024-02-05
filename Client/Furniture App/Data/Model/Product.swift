//
//  Product.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import Foundation

struct Product: Identifiable {
    var id: String
    var name: String
    var image: String
    var desc: String
    var supplier: String
    var price: Int
    var rating: Double
    var isAddedToFavourate: Bool
    
    init(name: String, image: String, desc: String, supplier: String, price: Int, rating: Double, isAddedToFavourate: Bool) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.desc = desc
        self.supplier = supplier
        self.price = price
        self.rating = rating
        self.isAddedToFavourate = isAddedToFavourate
    }
}

var productList: [Product] = [
    Product(
        name: "Coloured chair",
        image: "furniture-1",
        desc: "Two Assorted-color Padded Chairs Near Side Table",
        supplier: "IKEA",
        price: 399,
        rating: 4.5,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Dark wooden shelf",
        image: "furniture-2",
        desc: "",
        supplier: "IKEA",
        price: 379,
        rating: 5,
        isAddedToFavourate: true
    ),
    
    Product(
        name: "Light 2ooden shelf",
        image: "furniture-3",
        desc: "",
        supplier: "IKEA",
        price: 349,
        rating: 4.2,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Black fabric sofa",
        image: "furniture-4",
        desc: "",
        supplier: "IKEA",
        price: 499,
        rating: 3.6,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-5",
        desc: "",
        supplier: "IKEA",
        price: 449,
        rating: 4.7,
        isAddedToFavourate: true
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-5",
        desc: "",
        supplier: "IKEA",
        price: 449,
        rating: 3.2,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Wooden bed",
        image: "furniture-6",
        desc: "",
        supplier: "IKEA",
        price: 529,
        rating: 2.4,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Brown leather couch",
        image: "furniture-7",
        desc: "",
        supplier: "IKEA",
        price: 339,
        rating: 4.5,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-8",
        desc: "",
        supplier: "IKEA",
        price: 449,
        rating: 3.6,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Grey fabric couch",
        image: "furniture-9",
        desc: "",
        supplier: "IKEA",
        price: 349,
        rating: 2.7,
        isAddedToFavourate: false
    ),
    
    Product(
        name: "Purple armchair",
        image: "furniture-10",
        desc: "",
        supplier: "IKEA",
        price: 329,
        rating: 5,
        isAddedToFavourate: true
    ),
]

var carouselList: [Product] = Array(productList.prefix(5))
