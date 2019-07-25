//
//  TagItemCell.swift
//  ElmenusTask
//
//  Created by Mohamed Mongy on 7/23/19.
//  Copyright © 2019 Mohamed Mongy. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage


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
        guard let url = URL(string: tag.photoUrl) else { return }
        guard let image = UIImage(named: "") else { return }
        tagItemImgView.sd_setImage(with: url, placeholderImage: image)
    }
}
