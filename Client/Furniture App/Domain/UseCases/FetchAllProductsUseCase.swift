//
//  GetHomeScreenDataUseCase.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation

protocol PFetchAllProductsUseCase {
    func execute(completion: @escaping (Result<FetchAllProductsResponse, Error>) -> Void)
}

final class FetchAllProductsUseCase: PFetchAllProductsUseCase {
    private var productRepo: PProductRepository
    
    init(productRepo: PProductRepository) {
        self.productRepo = productRepo
    }
    
    func execute(completion: @escaping (Result<FetchAllProductsResponse, Error>) -> Void) {
        productRepo.fetchAllProducts { result in
            completion(result)
        }
    }
}
