//
//  RealmProtocol.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RealmSwift
import RxSwift



protocol RealmProtocol {
    func saveTagsToDB(tags: [Tag]) -> Observable<Void>
    func saveItemsToDB(items: [Item]) -> Observable<Void>
    func fetchTagsFromDB() -> Observable<[Tag]>
}


extension RealmProtocol {
    
    
    func saveTagsToDB(tags: [Tag]) -> Observable<Void> {
        let serviceDB = RealmDBService()
        return serviceDB.saveTagsToDB(tags: tags)
    }
    
    func saveItemsToDB(items: [Item]) -> Observable<Void> {
          let serviceDB = RealmDBService()
          return serviceDB.saveItemsToDB(items: items)
    }
    
    func fetchTagsFromDB() -> Observable<[Tag]>  {
        let serviceDB = RealmDBService()
        return serviceDB.fetchTagsFromDB()
    }

}
