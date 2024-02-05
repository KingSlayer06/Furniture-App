//
//  Furniture_AppApp.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 31/01/24.
//

import SwiftUI
import SwiftData

@main
struct Furniture_AppApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(HomeViewModel())
                .environmentObject(CartViewModel())
        }
        .modelContainer(for: ProductModel.self)
    }
}
