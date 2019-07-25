//
//  Reachability+Shared.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/25/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//


import Reachability
import RxReachability

extension Reachability {
    
        static let shared: Reachability = {
        
        let reachability = Reachability()
        try? reachability?.startNotifier()
        return reachability!
    }()
}
