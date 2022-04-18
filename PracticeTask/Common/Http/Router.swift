//
//  Router.swift
//  PracticeTask
//
//  Created by Shoaib Khan on 18/04/22.
//

import Foundation

// MARK:- Apis 
enum Router: String {
    
    static let BASE_SERVICE_URL = "https://jsonplaceholder.typicode.com/"
    static let BASE_IMAGE_URL =  ""

    case getUsers
    
    public func url() -> String {
        switch self {
        case .getUsers:
            return Router.oAuthRoute(path: "users")
        }
    }
    
    private static func oAuthRoute(path: String) -> String {
        return Router.BASE_SERVICE_URL + path
    }
    
}
