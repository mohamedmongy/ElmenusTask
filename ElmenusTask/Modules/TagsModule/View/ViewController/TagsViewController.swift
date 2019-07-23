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
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    //MARK: - Attributes
	var presenter: TagsPresenterProtocol?
    let disposeBag = DisposeBag()

    
    
    //MARK: -  View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCell()
        setCollectionViewFlowLayout()
        presenter?.attach()
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
        let rowItems:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 2.5 : 3.4
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
        let rowItems:CGFloat = UIDevice.current.userInterfaceIdiom == .phone ? 2.5 : 3.4
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
    
    
    
    
}
