//
//  CategoryCollectionViewCell.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab7 on 26/05/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var categoryImg: UIImageView!
    
    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
