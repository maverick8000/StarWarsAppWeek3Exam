//
//  NetworkManager.swift
//  StarWarsApp
//
//  Created by Raul Barranco on 7/22/22.
//

import Foundation
import UIKit

class NetworkManager {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        
        self.session = session
    }
    
    
}

extension NetworkManager {
    
    func fetchPage(urlStr: String, completion: @escaping (Result<Character, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            //completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                //return error
                return
            }
            
            do {
                let page = try JSONDecoder().decode(Character.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()

    }
}
