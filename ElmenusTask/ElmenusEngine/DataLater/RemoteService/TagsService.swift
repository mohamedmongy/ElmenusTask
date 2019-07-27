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



class TagsService {
    
    
    
    func fetchTags(pageNumber: String) -> Observable<TagRespone> {
        
        
        if Reachability.shared.connection != .none  {
            
         let rxProvider = MoyaProvider<TagsEndPoint>()
          return rxProvider.rx.request(.tags(pageNumber: pageNumber), callbackQueue: DispatchQueue.main)
            .filterSuccessfulStatusCodes()
            .do(onSuccess: { (res) in
                print(res)
            }, onError: { (error) in
                print(error)
            })
                .asObservable()
                .mapObject(TagRespone.self)
            .do(onNext: { res in
                print(res)
            })
                .catchError { error  in
//                      guard let moyaError = error as? MoyaError else {
//                        return Observable.error(ErrorType.unkown)
//                    }
                    return Observable.error(ErrorType.unkown)
            }
            
        } else {
             return Observable.error(ErrorType.noInternet)
        }
        
    }
    
}


