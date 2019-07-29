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
import Moya
import ObjectMapper


class TagsViewController: UIViewController, TagsViewControllerProtocol {

    
    
    
    //MARK: - Outlets
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    @IBOutlet weak var itemsLoadingIndicator: UIActivityIndicatorView!
    
    
    
    //MARK: - Attributes
	var presenter: TagsPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitleColor()
        setNavighationBarUI()
        registerCollectionViewCell()
        setCollectionViewFlowLayout()
        handleTagsCollectionViewItemSelection()
        handleItemsCollectionViewItemSelection()
        handleTagsCollectionVieweReachLastElement()
        BindToViewModelTags()
        BindToViewModelItems()
        bindToFirstTagViewModelToPopulateItemsCollectionVWhenTagsLoadedFirstTime()
        presenter?.attach()
    }
    
    
    
    //MARK: - Binding Datasource
    private func BindToViewModelTags() {
        guard let presenter = presenter else { return }
        presenter.viewModel.tags
            .bind(to: tagsCollectionView.rx.items) { collectionView, index, tag in
                let indexPath = IndexPath(row: index, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagItemCell.self), for: indexPath) as! TagItemCell
                cell.configure(tag: tag)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    private func bindToFirstTagViewModelToPopulateItemsCollectionVWhenTagsLoadedFirstTime() {
        guard let presenter = presenter else { return }
        presenter.viewModel.firstTag
            .subscribe(onNext: { tag in
                guard let tag = tag else { return }
                presenter.getItemsPerTag(name: tag.name)
        }).disposed(by: disposeBag)
    }
    
    private func BindToViewModelItems() {
        guard let presenter = presenter else { return }
        presenter.viewModel.items
            .bind(to: itemsCollectionView.rx.items) { collectionView, index, item in
                let indexPath = IndexPath(row: index, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagItemCell.self), for: indexPath) as! TagItemCell
                cell.configure(item: item)
                return cell
            }
            .disposed(by: disposeBag)
    }
    
    
    
    //MARK: - Collection View Reach Last Elemnt
    private func handleTagsCollectionVieweReachLastElement() {
        guard let presenter = presenter  else { return }
        tagsCollectionView.rx.reachedRight
            .skip(2)
            .subscribe(onNext: {  _ in
                guard let isLoading = presenter.viewModel.isLoading.value else { return }
                if !isLoading {
                    presenter.viewModel.page.accept(presenter.viewModel.page.value + 1)
                    presenter.fetchTagsNextPage()
                }
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK: - Collection View item Selection
    private func handleTagsCollectionViewItemSelection() {
        guard let presenter = presenter  else { return }
        tagsCollectionView.rx.itemSelected
            .subscribe(onNext: {  indexPath in
                // TODO: - Populate items collection view With corresponding tag item
                let tag = presenter.viewModel.tags.value[indexPath.row]
                presenter.getItemsPerTag(name: tag.name)
            }).disposed(by: disposeBag)
    }
    
    private func handleItemsCollectionViewItemSelection() {
        guard let presenter = presenter  else { return }
        itemsCollectionView.rx.itemSelected
            .subscribe(onNext: {  indexPath in
                let item = presenter.viewModel.items.value[indexPath.row]
                let itemBehavior = BehaviorRelay<Item>(value: item)
                presenter.navigateToItemDetailVC(item: itemBehavior)
            }).disposed(by: disposeBag)
    }
    
    
    
    //MARK: - Collection View FlowLayout Methods
    private func setCollectionViewFlowLayout() {
        setTagsCollectionViewFlowLayout()
        setItemsCollectionViewFlowLayout()
    }
    
    private func setTagsCollectionViewFlowLayout() {
        tagsCollectionView.collectionViewLayout.invalidateLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.minimumLineSpacing = 12
        let rowItems:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 2 : 3
        let cellHeight = tagsCollectionView.frame.size.height
        let cellWidth = (tagsCollectionView.frame.size.width / rowItems)
        flowLayout.itemSize = CGSize(width: cellWidth, height:  CGFloat(cellHeight))
        tagsCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setItemsCollectionViewFlowLayout() {
        itemsCollectionView.collectionViewLayout.invalidateLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.minimumLineSpacing = 12
        let rowItems:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 2 : 3
        let cellHeight = itemsCollectionView.frame.size.height
        let cellWidth = (itemsCollectionView.frame.size.width / rowItems)
        flowLayout.itemSize = CGSize(width: cellWidth, height:  CGFloat(cellHeight))
        itemsCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    
    
    //MARK: - Collection View Register Cell Methods
    private func registerCollectionViewCell(){
        registerTagsCollectionViewCell()
        registerItemsCollectionViewCell()
    }
    
    private func registerTagsCollectionViewCell() {
        let nib = UINib(nibName: String(describing: TagItemCell.self), bundle: Bundle.main)
        tagsCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: TagItemCell.self))
    }
    
    private func registerItemsCollectionViewCell() {
        let nib = UINib(nibName: String(describing: TagItemCell.self), bundle: Bundle.main)
        itemsCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: TagItemCell.self))
    }
    
    
    
    //MARK: - Loading Indicator
    func startAnimating() {
        loadingIndicator.startAnimating()
    }
    
    func stopAnimating() {
        loadingIndicator.stopAnimating()
    }
    
    func startAnimatingItemsIndicator() {
        itemsLoadingIndicator.startAnimating()
    }
    
    func stopAnimatingItemsIndicator() {
        itemsLoadingIndicator.stopAnimating()
    }
    
    
    
    //MARK: - Error View
    func showDefaultAlert(title:String?,message:String?, actionBlock:(()->Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title:"ok", style: .default
        ) { (action) in
            alertController.dismiss(animated: true){
            }
            actionBlock?()
        }
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
        }
    }
    
    
    //MARK: - Navigation Bar
    private func setNavigationBarTitleColor() {
        self.navigationController?.navigationBar.barTintColor = .darkGray
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setNavighationBarUI() {
        self.navigationItem.title = "Home"
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = false
    }
    
    
}
