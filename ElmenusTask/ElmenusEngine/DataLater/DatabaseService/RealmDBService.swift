//
//  RealmDBService.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/27/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RxSwift
import RealmSwift


struct RealmDBService {
    
    
    func saveTagsToDB(tags: [Tag]) -> Observable<Void> {
        
        
        do {
            let realm = try! Realm()
            try realm.write {
                
                let tags = tags
                tags.forEach({ (tag) in
                    let tagEntity = TagEntity()
                    tagEntity.name = tag.name
                    tagEntity.photoURL = tag.photoUrl
                    realm.add(tagEntity)
                })
            }
            return Observable.just(())
            
        }
        catch let  error {
            return Observable.error(error)
        }
        
    }
    
    
    func saveItemsToDB(items: [Item]) -> Observable<Void> {
        
        
        do {
            let realm = try! Realm()
            try realm.write {
                let items = items
                
                items.forEach({ item in
                    let itemEntity = ItemEntity()
                    itemEntity.id = item.id
                    itemEntity.name = item.name
                    itemEntity.photoURL = item.photoUrl
                    itemEntity.descrip = item.description
                    realm.add(itemEntity)
                })
            }
            return Observable.just(())
            
        }
        catch let  error {
            return Observable.error(error)
        }
        
    }
    
    
    func fetchTagsFromDB() -> Observable<[Tag]>  {
        
        do {
            
            let realm = try! Realm()
            let tags = realm.objects(TagEntity.self)
            var tagsArr: [Tag] = []
            
            tags.forEach { tagEntity in
                let tag = Tag(name: tagEntity.name, urlStr: tagEntity.photoURL)
                tagsArr.append(tag)
            }
            
            return Observable.just(tagsArr)
            
        }
        catch let  error {
            return Observable.error(error)
        }
    }
    
    
}
