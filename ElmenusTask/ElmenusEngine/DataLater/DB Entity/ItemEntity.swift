//
//  ItemEntity.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/27/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import RealmSwift


class ItemEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var photoURL = ""
    @objc dynamic var descrip = ""
    @objc dynamic var tag: TagEntity!


}
