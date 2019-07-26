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
    func fetchTags() -> [Tag]
}


extension RealmProtocol {
    
    
    func saveTagsToDB(tags: [Tag]) -> Observable<Void> {
    
    
        do {
              let realm = try! Realm()
              try realm.write {
                let tags = tags
                for tag in tags {
                    let tagEntity = TagEntity()
                    tagEntity.name = tag.name
                    tagEntity.photoURL = tag.photoUrl
                    realm.add(tagEntity)
                }
            }
            return Observable.just(())
            
        } catch let  error {
            return Observable.error(error)
        }
        
    }
    
    
    func fetchTags() -> [Tag] {
        return []
    }
    
    
    

}
