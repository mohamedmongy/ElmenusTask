//
//  TagsContract.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import Foundation
import RxSwift


//MARK: - Router
enum TagsRoute {
}

protocol TagsRouterProtocol: class {
    func go(to route:TagsRoute)
}



//MARK: - Presenter
protocol TagsPresenterProtocol: class {
    func attach()
    var viewModel: TagsViewModel  { get }

}



//MARK: - Interactor
protocol TagsInteractorProtocol: class {

    
}



//MARK: - View
protocol TagsViewControllerProtocol: class {
  var presenter: TagsPresenterProtocol?  { get set }
}
