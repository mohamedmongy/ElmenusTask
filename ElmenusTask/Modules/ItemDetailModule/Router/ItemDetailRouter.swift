//
//  ItemDetailRouter.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/27/19.
//
//

import UIKit
import RxCocoa



class ItemDetailRouter: ItemDetailRouterProtocol {
    
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule(item: BehaviorRelay<Item>) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ItemDetailViewController()
        let interactor = ItemDetailInteractor()
        let router = ItemDetailRouter()
        let presenter = ItemDetailPresenter(viewController: view, interactor: interactor, router: router)
        
        let viewModel = ItemDetailViewModel(item: item)
        presenter.viewModel = viewModel
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:ItemDetailRoute) {
        switch route {
        default: break
        }
    }

}
