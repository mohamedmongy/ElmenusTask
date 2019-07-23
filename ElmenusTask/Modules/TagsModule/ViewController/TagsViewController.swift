//
//  TagsViewController.swift
//  ElmenusTask
//
//  Created Mohamed Mongy on 7/23/19.
//
//

import UIKit
import RxSwift
import RxCocoa

class TagsViewController: UIViewController, TagsViewControllerProtocol {

    
    
    //MARK: - Outlets
    
    
    
    //MARK: - Attributes
	var presenter: TagsPresenterProtocol?
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
