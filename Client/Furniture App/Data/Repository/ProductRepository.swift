//
//  ProductRepository.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation
import Combine

final  class ProductRepository: PProductRepository {
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchAllProducts(completion: @escaping (Result<FetchAllProductsResponse, Error>) -> Void) {
        
        guard let url = URL(string: "http://localhost:8080/product/allProducts") else { return }
        
        print("fetchAllProducts API called")
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FetchAllProductsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                    case .finished:
                        print("fetchAllProducts Success !!")
                    case .failure(let error):
                        print("fetchAllProducts Failure: \(error)")
                        completion(.failure(error))
                }
            } receiveValue: { response in
                completion(.success(response))
            }
            .store(in: &cancellables)
    }
}
