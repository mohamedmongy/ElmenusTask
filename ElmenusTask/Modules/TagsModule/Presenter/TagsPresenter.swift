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
import RxCocoa
import Moya



class TagsPresenter: TagsPresenterProtocol {

    
    
    //MARK: - Attributes
    weak private var viewController: TagsViewControllerProtocol?
    var interactor: TagsInteractorProtocol?
    private let router: TagsRouterProtocol
    private let disposeBag = DisposeBag()
    var viewModel = TagsViewModel()

    
    
    //MARK:- init
    init(viewController: TagsViewControllerProtocol, interactor: TagsInteractorProtocol?, router: TagsRouterProtocol) {
        self.viewController = viewController
        self.interactor = interactor
        self.router = router
    }
    
    
    
    //MARK:- Attach
    func attach() {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        fetchTagsFromDBOrNewtworK()
    }
    
    
    
    //MARK:- Private functions
    private func fetchTagsFromDBOrNewtworK() {
        guard let interactor = interactor else { return }
        interactor.fetchTagsFromDB()
           .subscribe(onNext: { [weak self] tags in
            self?.fetchFromDBOrAPI(tags: tags)
        }, onError: { error in
             self.viewController?.showDefaultAlert(title: "Fetch tags from db", message: error.localizedDescription, actionBlock: nil)
        }).disposed(by: disposeBag)
    }
    
    private func fetchFromDBOrAPI(tags: [Tag]) {
        if tags.count == 0 {
            self.fetchTagsFirstPage()
        } else {
            self.viewModel.tags.accept(tags)
            self.viewModel.firstTag.accept(tags.first)
        }
    }
    
    private func fetchTagsFirstPage() {
        viewController?.startAnimating()
        viewModel.isLoading.accept(true)
        interactor?.getTags(pageNumber: "0")
            .flatMap({ tagResponse -> Observable<[Tag]> in
                print(tagResponse)
                return Observable.just(tagResponse.tags)
            })
            .filter({ $0.count != 0 })
            .subscribe(onNext: { [weak self] tags in
                self?.viewController?.stopAnimating()
                self?.viewModel.tags.accept(tags)
                self?.viewModel.firstTag.accept(tags.first)
                self?.saveTagsToRealmDB(tags: tags)
                }, onError: { error in
                    self.viewController?.stopAnimating()
                    self.viewController?.showDefaultAlert(title: "Fetch tags First Page from API", message: error.localizedDescription, actionBlock: nil)
            }).disposed(by: disposeBag)
    }
    
    private func saveTagsToRealmDB(tags: [Tag]) {
        guard let interactor = interactor else { return }
            interactor.saveTagsToDB(tags: tags)
                .subscribe(onNext: { _  in
                    self.viewController?.showDefaultAlert(title: "Congrats", message: "tags saved successfully to DB", actionBlock: nil)
                }, onError: { error in
                    self.viewController?.showDefaultAlert(title: "Error saving  tags to DB", message: error.localizedDescription, actionBlock: nil)

                }).disposed(by: disposeBag)
    }
    
    private func saveItemsToRealmDB(items: [Item]) {
        guard let interactor = interactor else { return }
        interactor.saveItemsToDB(items: items)
            .subscribe(onNext: { _  in
                self.viewController?.showDefaultAlert(title: "Congrats", message: "Items saved successfully WoooooW", actionBlock: nil)
            }, onError: { error in
                self.viewController?.showDefaultAlert(title: "Error saving  Items to DB", message: error.localizedDescription, actionBlock: nil)
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK:- Public functions
    func getItemsPerTag(name: String) {
        guard let interactor = interactor else { return }
        viewController?.startAnimatingItemsIndicator()
        interactor.getItems(tagName: name)
            .subscribe(onNext: {  [weak self] items in
                self?.viewController?.stopAnimatingItemsIndicator()
                self?.viewModel.items.accept(items)
                self?.saveItemsToRealmDB(items: items)
                }, onError: { error in
                    self.viewController?.stopAnimatingItemsIndicator()
                    self.viewController?.showDefaultAlert(title: "Error get Items Per Tag", message: error.localizedDescription, actionBlock: nil)
            }).disposed(by: disposeBag)
    }
    
    func fetchTagsNextPage() {
        let nextPage = String(viewModel.page.value)
        viewModel.isLoading.accept(true)
        viewController?.startAnimating()
        interactor?.getTags(pageNumber: nextPage)
            .flatMap({ tagResponse -> Observable<[Tag]> in
                print(tagResponse)
                return Observable.just(tagResponse.tags)
            })
            .filter({ $0.count > 0 })
            .subscribe(onNext: { [weak self] newTags in
                self?.viewController?.stopAnimating()
                self?.saveTagsToRealmDB(tags: newTags)
                guard let oldTags = self?.viewModel.tags.value else { return }
                self?.viewModel.tags.accept(oldTags + newTags)
                self?.viewModel.isLoading.accept(false)

                }, onError: { error in
                    self.viewModel.isLoading.accept(false)
                    self.viewController?.stopAnimating()
                    self.viewController?.showDefaultAlert(title: "Error fetch Tags Next Page", message: error.localizedDescription, actionBlock: nil)
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK:- Navigation functions
    func navigateToItemDetailVC(item: BehaviorRelay<Item> ) {
        router.go(to: .itemDetail(item: item))
    }
    

}
