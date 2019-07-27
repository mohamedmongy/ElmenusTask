//
//  TagEntity.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//


import RealmSwift


class TagEntity: Object {
    @objc dynamic var name = ""
    @objc dynamic var photoURL = ""
    let items =  List<ItemEntity>()
}
