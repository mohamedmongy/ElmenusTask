//
//  TagsContract.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import RxCocoa
import RxSwift


//MARK: - Router
enum TagsRoute {
    case itemDetail(item: BehaviorRelay<Item>)
}

protocol TagsRouterProtocol: class {
    func go(to route: TagsRoute)
}



//MARK: - Presenter
protocol TagsPresenterProtocol: class {
    func attach()
    var viewModel: TagsViewModel  { get }
    func getItemsPerTag(name: String)
    func fetchTagsNextPage()
    func navigateToItemDetailVC(item: BehaviorRelay<Item> )
}



//MARK: - Interactor
protocol TagsInteractorProtocol: TagsProtocol, ItemsProtocol, RealmProtocol {

    
}



//MARK: - View
protocol TagsViewControllerProtocol: class {
    var presenter: TagsPresenterProtocol?  { get set }
    func startAnimating()
    func stopAnimating()
    func startAnimatingItemsIndicator()
    func stopAnimatingItemsIndicator()
    func showDefaultAlert(title:String?,message:String?, actionBlock:(()->Void)?)
}
