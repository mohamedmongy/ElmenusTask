//
//  TagsPresenter.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import UIKit
import RxSwift

class TagsPresenter: TagsPresenterProtocol {

    
    //MARK: - Attributes
    weak private var viewController: TagsViewControllerProtocol?
    var interactor: TagsInteractorProtocol?
    private let router: TagsRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel =  TagsViewModel ()  

    
    
    //MARK:- init
    init(viewController: TagsViewControllerProtocol, interactor: TagsInteractorProtocol?, router: TagsRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    
    
    //MARK:- Functions
    func attach() {
        
        let intentLoad = viewController?.loadIntent().subscribe(onNext:  { () in
           
        }, onError:  nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
       
    }
    
    //MARK:- Private functions

}
