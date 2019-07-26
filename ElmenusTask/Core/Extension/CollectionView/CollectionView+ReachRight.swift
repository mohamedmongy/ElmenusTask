//
//  CollectionView+ReachRight.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/26/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



extension Reactive where Base: UIScrollView {

    
    var reachedRight: ControlEvent<Void> {
        
        let observable = contentOffset.flatMap {
            [weak base] contentOffset -> Observable<Void> in
            guard let scrollView = base else {
                return Observable.empty()
            }
            return contentOffset.x + scrollView.frame.size.width > (scrollView.contentSize.width + scrollView.frame.size.width / 5)  ? Observable.just(()) : Observable.empty()
        }
        return ControlEvent(events: observable)
    }
}
