//
//  ItemsProtocol.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//


import RxSwift


protocol ItemsProtocol {
    func getItems(tagName: String) -> Observable<[Item]>
}


extension ItemsProtocol {
    
    func getItems(tagName: String) -> Observable<[Item]> {
             let itemService = ItemsService()
               return itemService.fetchItems(tagName: tagName)
                .flatMap({ itemResponse -> Observable<[Item]> in
                    return Observable.just(itemResponse.items)
                })
    }
}
