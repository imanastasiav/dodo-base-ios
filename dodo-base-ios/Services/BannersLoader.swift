//
//  BannersLoader.swift
//  newApp1
//
//  Created by Анастасия on 08.11.2025.
//

import Foundation

protocol IBannersLoader {
    func loadBanners(completion: @escaping (Result<[Product], Error>) -> ())
}

final class BannersLoader: IBannersLoader {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }

    func loadBanners(completion: @escaping (Result<[Product], Error>) -> ()) {

        guard let url = URL(string: "http:localhost:3003/banners") else { return }
    
        //формирование запроса на какой-то адрес api
        let request = URLRequest(url: url) //это структура
        
        
        let task = session.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(NetworkError.statusCode))
            }
            
            guard let data else { return }
            
            do {
                let products = try self.decoder.decode([Product].self, from: data) //попытка декодировать json файл в структуру Product
                
                DispatchQueue.main.async {
                    completion(.success(products))
                }
                
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()

    }
}

//кложур выполняется тогда, когда дата таска выполнится
//они способны сохраняться после завершения жизненного цикла нашей функции
