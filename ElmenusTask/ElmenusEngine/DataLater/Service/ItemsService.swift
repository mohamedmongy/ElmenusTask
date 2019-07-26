//
//  ItemsService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift


class ItemsService: APIService<ItemsEndPoint> {
    
    func fetchItems(tagName: String) -> Observable<ItemResponse> {
        return  request(target: .items(tagname: tagName))
    }
    
}
