//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by Berkay Kuzu on 12.12.2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.title
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}

//16. vİDEO 14.51
