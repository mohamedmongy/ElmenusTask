//
//  TagItemCell.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/23/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher


class TagItemCell: UICollectionViewCell {

    
    @IBOutlet weak var tagItemNameLbl: UILabel!
    @IBOutlet weak var tagItemImgView: UIImageView!
    
    var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        tagItemNameLbl.text = nil
        tagItemImgView.image = nil
        disposeBag = DisposeBag()
    }
}

extension TagItemCell {
    func configure(tag: Tag) {
        tagItemNameLbl.text = tag.name
        clipImageCorners()
        guard let url = URL(string: tag.photoUrl) else { return }
        tagItemImgView.kf.indicatorType = .activity
        tagItemImgView.kf.setImage(with: url)
    }
}


extension TagItemCell {
    func configure(item: Item) {
        tagItemNameLbl.text = item.name
        clipImageCorners()
        guard let url = URL(string: item.photoUrl) else { return }
        tagItemImgView.kf.indicatorType = .activity
        tagItemImgView.kf.setImage(with: url)
    }
}

extension TagItemCell {
    private func clipImageCorners() {
        tagItemImgView.layer.cornerRadius = self.tagItemImgView.frame.size.width / 2
        tagItemImgView.clipsToBounds = true
    }
}
