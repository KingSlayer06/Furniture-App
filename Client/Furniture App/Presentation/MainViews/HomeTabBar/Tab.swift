//
//  Tab.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI

enum Tab: Int, Identifiable {
    
    var id: Self {
        return self
    }
    
    case home = 0
    case search = 1
    case cart = 2
    case profile = 3
    
    var image: String {
        switch self {
            case .home: "house"
            case .search: "square.grid.2x2"
            case .cart: "cart"
            case .profile: "person"
        }
    }
    
    var selectedImage: String {
        switch self {
            case .home: "house.fill"
            case .search: "square.grid.2x2.fill"
            case .cart: "cart.fill"
            case .profile: "person.fill"
        }
    }
}

var tabs: [Tab] = [.home, .search, .cart, .profile]
