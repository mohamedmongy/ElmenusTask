//
//  TagsPresenter.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import UIKit
import RxSwift
import RealmSwift



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
    
    
    
    //MARK:- Attach
    func attach() {
         print(Realm.Configuration.defaultConfiguration.fileURL!)
         fetchTagsFirstPage()
    }
    
    
    
    //MARK:- Public functions
    func getItemsPerTag(name: String) {
        guard let interactor = interactor else { return }
        viewController?.startAnimatingItemsIndicator()
        interactor.getItems(tagName: name)
            .subscribe(onNext: {  [weak self] items in
                self?.viewController?.stopAnimatingItemsIndicator()
                self?.viewModel.items.accept(items)
            }, onError: { error in
                  print("tags >>>>>>>>>> \(error)")
                  self.viewController?.stopAnimatingItemsIndicator()
                  
            }).disposed(by: disposeBag)
    }
    
    func fetchTagsNextPage() {
        let nextPage = String(viewModel.page.value)
        viewModel.isLoading.accept(true)
        viewController?.startAnimating()
        interactor?.getTags(pageNumber: nextPage)
            .filter({ $0.count > 0 })
            .subscribe(onNext: { [weak self] newTags in
                self?.viewController?.stopAnimating()
                guard let oldTags = self?.viewModel.tags.value else { return }
                self?.viewModel.tags.accept(oldTags + newTags)
                self?.viewModel.isLoading.accept(false)
                
            }, onError: { error in
                 print("tags >>>>>>>>>> \(error)")
                 self.viewModel.isLoading.accept(false)
                 self.viewController?.stopAnimating()
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK:- Private functions
    private func fetchTagsFirstPage() {
        viewController?.startAnimating()
        viewModel.isLoading.accept(true)
        guard let interactor = interactor else { return }
        interactor.getTags(pageNumber: "0")
            .subscribe(onNext: { [weak self] tags in
                self?.saveTagsToRealmDB(tags: tags)
                self?.viewController?.stopAnimating()
                self?.viewModel.tags.accept(tags)
//                self?.viewModel.isLoading.accept(false)
                }, onError: { error in
                    print("tags >>>>>>>>>> \(error)")
                    self.viewController?.stopAnimating()
//                    self.viewModel.isLoading.accept(false)
            }).disposed(by: disposeBag)
    }
    
    
    private func saveTagsToRealmDB(tags: [Tag]) {
        guard let interactor = interactor else { return }
            interactor.saveTagsToDB(tags: tags)
                .subscribe(onNext: { _  in
                    print("tags saved successfully WoooooW")
                }, onError: { error in
                    print("error saving  tags Booooooom")
                }).disposed(by: disposeBag)
    }
    

}
