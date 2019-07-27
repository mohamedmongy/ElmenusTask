//
//  TagsViewModel.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import RxSwift
import RxCocoa


struct TagsViewModel {
    
    
    // DataSource
    let tags = BehaviorRelay<[Tag]>(value: [])
    let items = BehaviorRelay<[Item]>(value: [])
    let firstTag = BehaviorRelay<Tag?>(value: nil)
    
    
    // fetch next Page
    let page = BehaviorRelay<Int>(value: 0)
    let isLoading = BehaviorRelay<Bool?>(value: nil)
    
}
