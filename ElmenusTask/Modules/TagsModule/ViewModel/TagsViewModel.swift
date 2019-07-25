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
    
    let localization =  TagsLocalization()
    let tags = BehaviorRelay<[Tag]>(value: [])
}
