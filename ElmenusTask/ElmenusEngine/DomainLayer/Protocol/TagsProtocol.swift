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
        
//        let tags = [Tag(name: "0 - Deserts", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2276d5d-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Deserts", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2276d5d-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Egyptian", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b22089ab-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg"),
//                    Tag(name: "0 - Pasta", urlStr: "https://s3-eu-west-1.amazonaws.com//elmenusv5/Normal/b2374d41-27b7-11e8-add5-0242ac110011.jpg")
//        ]
//        return Observable.just(tags)
       let tagService = TagsService()
       return tagService.fetchTags(pageNumber: pageNumber)
        .flatMap({ tagResponse -> Observable<[Tag]> in
            return Observable.just(tagResponse.tags)
        })
    }
}
