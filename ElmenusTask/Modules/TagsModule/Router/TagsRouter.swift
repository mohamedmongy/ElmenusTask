//
//  TagsRouter.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import UIKit

class TagsRouter: TagsRouterProtocol {
    
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    
    
    //MARK:- Assemple
    static func assembleModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = TagsViewController()
        let interactor = TagsInteractor()
        let router = TagsRouter()
        let presenter = TagsPresenter(viewController: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    
    //MARK: - Routing
    func go(to route:TagsRoute) {
        switch route {
        default: break
        }
    }

}
