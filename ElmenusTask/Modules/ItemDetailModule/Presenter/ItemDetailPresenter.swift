//
//  ItemDetailPresenter.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/27/19.
//
//

import UIKit
import RxSwift

class ItemDetailPresenter: ItemDetailPresenterProtocol {
    

    
    //MARK: - Attributes
    weak private var viewController: ItemDetailViewControllerProtocol?
    var interactor: ItemDetailInteractorProtocol?
    private let router: ItemDetailRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel: ItemDetailViewModel!

    
    
    //MARK:- init
    init(viewController: ItemDetailViewControllerProtocol, interactor: ItemDetailInteractorProtocol?, router: ItemDetailRouterProtocol) {
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
