//
//  TagsService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift



class TagsService: APIService<TagsEndPoint> {
    
    func fetchTags(pageNumber: String) -> Observable<TagRespone> {
        return  request(target: .tags(pageNumber: pageNumber))
    }
    
}


