//
//  UserVM.swift
//  PracticeTask
//
//  Created by Shoaib Khan on 18/04/22.
//

import Foundation

class UserVM{
     
//  MARK:- function to get the users from server
    func getUsers<T: Decodable>(type: T.Type, successBlock success : @escaping (_ responseData : T) -> Void, failureBlock failure: @escaping (_ error: Error) -> Void) {
        NetworkManager.shared.getApi(url: Router.getUsers.url(), params: [:]) { responseData in
            print(responseData)
            do {
                let decoder = JSONDecoder()
                let root = try decoder.decode(T.self, from: responseData)
                success(root)
            } catch {
                print(error)
            }
        } failureBlock: { error in
            print(error.localizedDescription)
        }
    }
}
