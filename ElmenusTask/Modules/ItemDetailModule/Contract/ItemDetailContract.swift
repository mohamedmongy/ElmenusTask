//
//  ItemDetailContract.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/27/19.
//
//

import Foundation
import RxSwift


//MARK: - Router
enum ItemDetailRoute {
}

protocol ItemDetailRouterProtocol: class {
    func go(to route:ItemDetailRoute)
}



//MARK: - Presenter
protocol ItemDetailPresenterProtocol: class {
    func attach()
    var viewModel: ItemDetailViewModel!  { get }

}



//MARK: - Interactor
protocol ItemDetailInteractorProtocol: class {

    
}



//MARK: - View
protocol ItemDetailViewControllerProtocol: class {
  var presenter: ItemDetailPresenterProtocol?  { get set }
}
