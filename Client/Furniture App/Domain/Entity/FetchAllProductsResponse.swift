//
//  GetHomeScreenDataResponse.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation

struct FetchAllProductsResponse: Codable {
    var banners: [Product] = []
    var products: [Product] = []
    
    init() {
        
    }
}
