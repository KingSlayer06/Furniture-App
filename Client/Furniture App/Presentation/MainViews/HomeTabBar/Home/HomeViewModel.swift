//
//  HomeViewModel.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var selectedTab: Tab = .home
    @Published private (set) var products = [Product]()
    
    private let fetchAllProductsUseCase: PFetchAllProductsUseCase?
    
    init() {
        self.fetchAllProductsUseCase = FetchAllProductsUseCase(productRepo: ProductRepository())
        self.products = productList
    }
    
    @MainActor
    func fetchProducts() {
        self.fetchAllProductsUseCase?.execute { result in
            switch result {
            case .success(let response):
                self.products = response
            case .failure(let error):
                print("Error")
            }
        }
    }
}
