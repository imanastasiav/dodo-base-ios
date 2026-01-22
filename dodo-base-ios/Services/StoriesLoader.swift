//
//  StoriesService.swift
//  newApp1
//
//  Created by Анастасия on 20.12.2025.
//

import UIKit

protocol IStoryLoader {
    func loadStories(completion: @escaping (Result<[Story], Error>) -> Void)
}

final class StoriesLoader: IStoryLoader {
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func loadStories(completion: @escaping (Result<[Story], Error>) -> ()) {
        
        guard let url = URL(string: "http:localhost:3003/stories") else { return }
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.statusCode))
            }
            
            guard let data else { return }
            
            do {
                let stories = try self.decoder.decode([Story].self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(stories))
                }
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
