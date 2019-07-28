//
//  TagsService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper
import Reachability
import RxReachability



class TagsService : APIService<TagsEndPoint> {
    
    
    func fetchTags(pageNumber: String) -> Observable<TagRespone> {
        return request(target: .tags(pageNumber: pageNumber))
        
//        if Reachability.shared.connection != .none  {
//
//         let rxProvider = MoyaProvider<TagsEndPoint>()
//          return rxProvider.rx.request(.tags(pageNumber: pageNumber))
//            .filterSuccessfulStatusCodes()
//
//                .asObservable()
//                .mapObject(TagRespone.self)
//
//                .catchError { error  in
//
//                    return Observable.error(ErrorType.unkown)
//            }
//
//        } else {
//             return Observable.error(ErrorType.noInternet)
//        }
        
    }
    
}


