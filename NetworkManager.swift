//
//  NetworkManager.swift
//  ImdbDemo
//
//  Created by Aman Kumar on 25/06/22.
//

import Foundation
enum ResquestType {
    case get
    case post(Data)
}

protocol NetworkRouter {
    func getResponse<T: Codable>(requestType: ResquestType, url: URL, responseType: T.Type, completion: @escaping (Result<T,Error>) -> Void)
}

struct NetworkManager: NetworkRouter {
    
    private var key = "38a73d59546aa378980a88b645f487fc"
    
    func getResponse<T: Codable>(requestType: ResquestType, url: URL, responseType: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let data = data, error == nil {
                do {
                    let result = try JSONDecoder().decode(responseType.self, from: data)
                    completion(.success(result))
                } catch {
                    debugPrint(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            completion(.failure(error!))
        }.resume()
    }
}
