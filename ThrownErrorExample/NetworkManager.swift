//
//  NetworkManager.swift
//  ThrownErrorExample
//
//  Created by Yasin Dalkılıç on 16.03.2025.
//

import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    private init(){}
    
    func apiCall<T: Decodable>(type: T.Type, completion: @escaping (Result<T, Error>) -> Void) throws {
        // https://jsonplaceholder.typicode.com/users data'yı görmek için URL içine kopyala-yapıştır
        guard let url = URL(string: "") else {
            throw NetworkError.invalidURL // burda yukardaki throws keywordünü kaldırıp direk completion block içersinde error handle edilebilir. fakat throw örneği için burda durması önemli. İlla throw kullanmaya gerek yok. fakat hatayı görmek için iyi bir seçim olabilir. komple stringi boş bırakıp deneyebilirsin.
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }catch {
                    completion(.failure(error))
                }
            }else {
                completion(.failure(NetworkError.unknown))
            }
        }
        
        task.resume()
    }
}
