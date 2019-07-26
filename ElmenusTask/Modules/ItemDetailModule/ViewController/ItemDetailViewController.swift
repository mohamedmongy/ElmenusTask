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
import Kingfisher


class ItemDetailViewController: UIViewController, ItemDetailViewControllerProtocol {
    
    
    
    
    //MARK: - Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    let back = UIButton()
    
    
    
    //MARK: - Attributes
    var presenter: ItemDetailPresenterProtocol?
    let disposeBag = DisposeBag()
    
    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        BindToViewModelItem()
        presenter?.attach()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarTitleColor()
        setNavighationBarUI()
    }
    
    
    
    //MARK: - Binding
    private func BindToViewModelItem() {
        guard let presenter = presenter else { return }
        presenter.viewModel.item?
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { item  in
                self.setUpUI(item: item)
            }, onError: { error in
                print("error in details vc")
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK: - UI Setup
    private func setUpUI(item: Item) {
        nameLbl.text = item.name
        descriptionLbl.text = item.description
        clipImageCorners()
        guard let url = URL(string: item.photoUrl) else { return }
        itemImageView.kf.indicatorType = .activity
        itemImageView.kf.setImage(with: url)
    }
    
    private func clipImageCorners() {
        self.itemImageView.layer.cornerRadius = self.itemImageView.frame.size.width / 2
        self.itemImageView.clipsToBounds = true
    }
    
    
    
    //MARK: - Navigation Bar
    private func setNavigationBarTitleColor() {
        self.navigationController?.navigationBar.barTintColor = .darkGray
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setNavighationBarUI() {
        guard let viewModel = presenter?.viewModel else { return }
        self.navigationItem.title = viewModel.item?.value.name
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.isHidden = false
        navigationItem.backBarButtonItem = UIBarButtonItem(customView: back)
        navigationItem.backBarButtonItem?.title = "Back"
        navigationItem.hidesBackButton = false
    }
    
}
