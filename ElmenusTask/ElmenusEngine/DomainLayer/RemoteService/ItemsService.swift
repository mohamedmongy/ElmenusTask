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
        
        return Observable.create { observer -> Disposable in
            
            let rxProvider = MoyaProvider<ItemsEndPoint>()
             rxProvider.rx.request(.items(tagname: tagName), callbackQueue: DispatchQueue.main)
                .subscribe { event in
                    switch event {
                    case let .success(response):
                        let resp = try! response.mapObject(ItemResponse.self)
                        observer.onNext(resp)
                    case let .error(error):
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
    }
    
}
