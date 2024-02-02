//
//  Product.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
}

var productList: [Product] = [
    Product(
        name: "Coloured chair",
        image: "furniture-1",
        description: "Two Assorted-color Padded Chairs Near Side Table",
        supplier: "IKEA",
        price: 399
    ),
    
    Product(
        name: "Dark wooden shelf",
        image: "furniture-2",
        description: "",
        supplier: "IKEA",
        price: 379
    ),
    
    Product(
        name: "Light 2ooden shelf",
        image: "furniture-3",
        description: "",
        supplier: "IKEA",
        price: 349
    ),
    
    Product(
        name: "Black fabric sofa",
        image: "furniture-4",
        description: "",
        supplier: "IKEA",
        price: 499
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-5",
        description: "",
        supplier: "IKEA",
        price: 449
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-5",
        description: "",
        supplier: "IKEA",
        price: 449
    ),
    
    Product(
        name: "Wooden bed",
        image: "furniture-6",
        description: "",
        supplier: "IKEA",
        price: 529
    ),
    
    Product(
        name: "Brown leather couch",
        image: "furniture-7",
        description: "",
        supplier: "IKEA",
        price: 339
    ),
    
    Product(
        name: "White fabric sofa",
        image: "furniture-8",
        description: "",
        supplier: "IKEA",
        price: 449
    ),
    
    Product(
        name: "Grey fabric couch",
        image: "furniture-9",
        description: "",
        supplier: "IKEA",
        price: 349
    ),
    
    Product(
        name: "Purple armchair",
        image: "furniture-10",
        description: "",
        supplier: "IKEA",
        price: 329
    ),
]

var carouselList: [Product] = Array(productList.prefix(5))
