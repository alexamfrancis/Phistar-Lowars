//
//  ServiceLayer.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/16/21.
//

import Foundation

enum PLError: Error {
    case decoding
}

class ServiceLayer {
    
    class func request<Collection: Codable>(router: Router, completion: @escaping (Result<Collection, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.queryItems

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            guard let responseObject = try? JSONDecoder().decode(Collection.self, from: data) else {
                completion(.failure(PLError.decoding))
                print("Collection Decoding Error")
                return
            }
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()
    }
    
    class func request<Collection: Codable>(urlString: String, completion: @escaping (Result<Collection, Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }
            guard response != nil, let data = data else {
                return
            }
            guard let responseObject = try? JSONDecoder().decode(Collection.self, from: data) else {
                completion(.failure(PLError.decoding))
                print("Collection Decoding Error")
                return
            }
            DispatchQueue.main.async {
                completion(.success(responseObject))
            }
        }
        dataTask.resume()

    }

}
