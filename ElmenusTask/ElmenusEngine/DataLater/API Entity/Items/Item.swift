//
//  Item.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import ObjectMapper


struct Item: Mappable {
    
    
    //MARK: - MEMBER VARIABLES
    var id: String = ""
    var name: String = ""
    var photoUrl: String = ""
    var description: String = ""
    
    
    //MARK: - INIT
    init?(map: Map) { }
    
    init(id: String, urlStr: String, name: String, description: String) {
        self.id = id
        self.name = name
        self.photoUrl = urlStr
        self.description = description
    }
    
    
    //MARK: - Mapping
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        photoUrl <- map["photoUrl"]
        description <- map["description"]
    }
    
    
}
