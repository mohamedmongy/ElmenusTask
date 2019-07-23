//
//  Tag.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import ObjectMapper


struct Tag: Mappable {
    
    //MARK: - MEMBER VARIABLES
    var name: String = ""
    var photoUrl: String = ""
    
    //MARK: - INIT
    init?(map: Map) { }
        
    
    //MARK: - Mapping
    mutating func mapping(map: Map) {
        name <- map["tagName"]
        photoUrl <- map["photoURL"]

    }
    
   
}
