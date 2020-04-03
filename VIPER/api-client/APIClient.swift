//
//  APIClient.swift
//  VIPER
//
//  Created by Farhan Mirza on 02/04/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import Foundation

protocol APIClientProtocol {
    func getPosts(completion : @escaping (Result<[Post], Error>) -> ())
}


// apiClient class to handle network requests
class APIClient : APIClientProtocol {
    
    // MARK: GenericRequest
    private func performRequest<T:Decodable>(url:String, decoder: JSONDecoder = JSONDecoder(), parameters : [String :Any]?  = nil ,completion:@escaping (Result<T,Error>)->Void)  {
        
        guard let url = URL(string: url) else {return}
        
        let request = URLRequest(url: url)
        
        if let _ = parameters {
        // add parameters for future request...
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // failure
                completion(.failure(error))
            }
            do {
                // reponse
                let responseData = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(responseData))
            }
            catch let jsonError {
                // json parse failure
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    
    // MARK: GetCreditRequest
    func getPosts(completion :  @escaping (Result<[Post], Error>) -> ()) {
        performRequest(url: "https://jsonplaceholder.typicode.com/posts") { result in
            completion(result)
        }
        
    }
}




