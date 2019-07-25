//
//  TagsProtocol.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift


protocol TagsProtocol {
     func getTags(pageNumber: String) -> Observable<[Tag]>
}


extension TagsProtocol {
    
    func getTags(pageNumber: String) -> Observable<[Tag]> {
        let tagService = TagsService()
       return tagService.fetchTags(pageNumber: pageNumber)
        .flatMap({ tagResponse -> Observable<[Tag]> in
            return Observable.just(tagResponse.tags)
        })
    }
}
