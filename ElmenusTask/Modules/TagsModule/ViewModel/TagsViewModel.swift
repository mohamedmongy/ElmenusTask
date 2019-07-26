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
    
    let tags = BehaviorRelay<[Tag]>(value: [])
    let items = BehaviorRelay<[Item]>(value: [])
}
