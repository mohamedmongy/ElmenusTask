//
//  ItemsService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper
import Reachability
import RxReachability



class ItemsService {
    
    func fetchItems(tagName: String) -> Observable<ItemResponse> {
        
        if Reachability.shared.connection != .none  {
            
            let rxProvider = MoyaProvider<ItemsEndPoint>()
            return rxProvider.rx.request(.items(tagname: tagName), callbackQueue: DispatchQueue.main)
                .filterSuccessfulStatusCodes()
                .asObservable()
                .mapObject(ItemResponse.self)
                .catchError { error  in
                    return Observable.error(ErrorType.unkown)
            }
            
        } else {
            return Observable.error(ErrorType.noInternet)
        }
        
    }
    
}
