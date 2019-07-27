//
//  ItemResponse.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import Foundation


import ObjectMapper



struct ItemResponse: Mappable {
    
    
    //MARK: - MEMBER VARIABLES
    var items: [Item] = []
    
    
    //MARK: - INIT
    init?(map: Map) { }
    
    
    //MARK: - Mapping
    mutating func mapping(map: Map) {
        items <- map["items"]
    }
    
}
