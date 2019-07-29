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
import RxCocoa



class TagsService {
    
    let disposeBag = DisposeBag()
    
    
    func fetchTags(pageNumber: String) -> Observable<TagRespone> {
        
        return Observable.create { observer -> Disposable in
            
            let rxProvider = MoyaProvider<TagsEndPoint>()
             rxProvider.rx.request(.tags(pageNumber: pageNumber))
                
                .subscribe { event in
                    switch event {
                    case let .success(response):
                        let resp = try! response.mapObject(TagRespone.self)
                        observer.onNext(resp)
                    case let .error(error):
                        observer.onError(error)
                    }
                 }
            return Disposables.create()
        }
    }
    
    
}


