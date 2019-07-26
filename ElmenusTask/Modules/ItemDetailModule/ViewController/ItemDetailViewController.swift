//
//  ItemDetailViewController.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/27/19.
//
//

import UIKit
import RxSwift
import RxCocoa

class ItemDetailViewController: UIViewController, ItemDetailViewControllerProtocol {

    
    
    //MARK: - Outlets
    
    
    
    //MARK: - Attributes
	var presenter: ItemDetailPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.attach()
    }
    
    
    
    //MARK: - Intents
    func loadIntent() -> Observable<Void> {
        return Observable.just(())
    }
    
    
    
    //MARK: - Display
    
}
