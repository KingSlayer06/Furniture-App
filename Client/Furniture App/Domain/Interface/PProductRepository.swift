//
//  PProductRepository.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation

protocol PProductRepository {
    func fetchAllProducts(completion: @escaping (Result<FetchAllProductsResponse, Error>) -> Void)
}
