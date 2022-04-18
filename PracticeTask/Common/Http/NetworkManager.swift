//
//  NetworkManager.swift
//  PracticeTask
//
//  Created by Shoaib Khan on 18/04/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {
    }
    
    
    // MARK :- Generalize method to fetch data from server
    func getApi(url Url: String, params Parameters : [String: AnyObject]?, successBlock success : @escaping (_ responseData : Data) -> Void, failureBlock failure: @escaping (_ error: Error) -> Void) {
        
        let url = URL(string: Url)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            success(data)
        }
        task.resume()
    }
}
