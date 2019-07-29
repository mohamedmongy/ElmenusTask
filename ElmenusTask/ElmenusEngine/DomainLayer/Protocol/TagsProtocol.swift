//
//  TagsProtocol.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift
import Moya
import RxCocoa


protocol TagsProtocol {
     func getTags(pageNumber: String) -> Observable<TagRespone>
}


extension TagsProtocol {
    
    func getTags(pageNumber: String) -> Observable<TagRespone> {
       let tagService = TagsService()
       return tagService.fetchTags(pageNumber: pageNumber)
    }
    
    
}
