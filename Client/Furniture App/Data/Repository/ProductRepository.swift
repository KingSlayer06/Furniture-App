//
//  ProductRepository.swift
//  Furniture App
//
//  Created by Himanshu Sherkar on 05/02/24.
//

import Foundation
import Combine

final  class ProductRepository: PProductRepository {
    
    func fetchAllProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: "") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { response in
                switch response {
                    case .finished:
                        print("getHomeScreenData Success !!")
                    case .failure(let error):
                        print("getHomeScreenData Failure: \(error)")
                        completion(.failure(error))
                }
            } receiveValue: { response in
                completion(.success(response))
            }
    }
}
