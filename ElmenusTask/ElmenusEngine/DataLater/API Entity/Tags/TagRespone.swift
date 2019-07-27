//
//  TagRespone.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/24/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import ObjectMapper



struct TagRespone: Mappable {
    
    //MARK: - MEMBER VARIABLES
    var tags: [Tag] = []

    //MARK: - INIT
    init?(map: Map) { }
    
    //MARK: - Mapping
    mutating func mapping(map: Map) {
        tags <- map["tags"]
    }
    
}
