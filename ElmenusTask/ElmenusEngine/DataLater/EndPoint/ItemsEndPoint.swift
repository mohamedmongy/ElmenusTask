//
//  ItemsEndPoint.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//


import Moya


enum ItemsEndPoint {
    case items(tagname: String)
}

extension ItemsEndPoint: TargetType, AccessTokenAuthorizable {
    
    
    var baseURL: URL {
        let  url  = URL(string: "https://elmenus-assignment.getsandbox.com/items")!
        return url
    }
    
    var path: String {
        switch self {
        case .items(tagname: let name):
            return "/\(name)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .items:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .items:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type" : "application/json"
        ]
    }
    
    var authorizationType: AuthorizationType {
        return .bearer
    }
    
}

