//
//  CategoriesLoader.swift
//  newApp1
//
//  Created by Анастасия on 19.11.2025.
//

import Foundation

protocol ICategoriesLoader {
    func loadCategories(completion: @escaping (Result<[Category], Error>) -> ())
}

final class CategoriesLoader: ICategoriesLoader {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func loadCategories(completion: @escaping (Result<[Category], Error>) -> ()) {
        
        guard let url = URL(string: "http:localhost:3003/categories") else { return }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.statusCode))
            }
            
            guard let data else { return }
            
            do {
                let categories = try self.decoder.decode([Category].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(categories))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
