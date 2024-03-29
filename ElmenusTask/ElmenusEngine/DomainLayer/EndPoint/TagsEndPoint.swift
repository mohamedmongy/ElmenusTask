//
//  TagsEndPoint.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import Moya


enum TagsEndPoint {
    case tags(pageNumber: String)
}

extension TagsEndPoint: TargetType, AccessTokenAuthorizable {
    
    
    var baseURL: URL {
         let  url  = URL(string: "https://elmenus-assignment.getsandbox.com/tags")!
        return url
    }
    
    var path: String {
        switch self {
        case .tags(pageNumber: let pageNumber):
            return "/\(pageNumber)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .tags:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .tags:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type":"application/json"
        ]
    }
    
    var authorizationType: AuthorizationType {
        return .bearer
    }
    
}

