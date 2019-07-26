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
        interactor.getItems(tagName: name)
            .subscribe(onNext: {  [weak self] items in
                self?.viewModel.items.accept(items)
            }, onError: { error in
                  print("tags >>>>>>>>>> \(error)")
            }).disposed(by: disposeBag)
    }
    
    func fetchTagsNextPage(pageNumber: String) {
        interactor?.getTags(pageNumber: pageNumber)
            .subscribe(onNext: { [weak self] newtags in
                guard let oldTags = self?.viewModel.tags.value else { return }
                self?.viewModel.tags.accept(oldTags + newtags)
            }, onError: { error in
                 print("tags >>>>>>>>>> \(error)")
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK:- Private functions
    private func fetchTagsFirstPage() {
        viewController?.startAnimating()
        guard let interactor = interactor else { return }
        interactor.getTags(pageNumber: "0")
            .subscribe(onNext: { [weak self] tags in
                self?.saveTagsToRealmDB(tags: tags)
                self?.viewController?.stopAnimating()
                self?.viewModel.tags.accept(tags)
                }, onError: { error in
                    print("tags >>>>>>>>>> \(error)")
                    self.viewController?.stopAnimating()
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
