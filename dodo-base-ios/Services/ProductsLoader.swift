//
//  ProductService.swift
//  newApp1
//
//  Created by Анастасия on 24.09.2025.
//

import UIKit
import SnapKit

import Foundation

protocol IProductsLoader {
    func loadProducts(completion: @escaping (Result<[Product], Error>) -> ())
}

final class ProductsLoader: IProductsLoader {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    //используем как конструктор,чтобы собрать сложный сервис из нескольких простых сервисов
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func loadProducts(completion: @escaping (Result<[Product], Error>) -> ()) {
        
        guard let url = URL(string: "http:localhost:3003/products") else { return }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.statusCode))
            }
            
            guard let data else { return }
            
            do {
                let products = try self.decoder.decode([Product].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(products))
                } //UI всегда на главном потоке
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }    
}
