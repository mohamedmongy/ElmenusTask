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
        fetchTagsFirstPage()
    }
    
    
    //MARK:- Private functions
    private func fetchTagsFirstPage() {
        viewController?.startAnimating()
        guard let interactor = interactor else { return }
        interactor.getTags(pageNumber: "0")
            .subscribe(onNext: { [weak self] tags in
                self?.viewController?.stopAnimating()
                self?.viewModel.tags.accept(tags)
        }, onError: { error in
            print("tags >>>>>>>>>> \(error)")
            self.viewController?.stopAnimating()
        }).disposed(by: disposeBag)
    }

}
