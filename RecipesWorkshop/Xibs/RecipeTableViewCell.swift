//
//  RecipeTableViewCell.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab8 on 26/05/2023.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

<<<<<<< HEAD
    @IBOutlet weak var recipeBgImg: UIImageView!
    @IBOutlet weak var recipeCrediteNameLabel: UILabel!
    @IBOutlet weak var recipeServings: UILabel!
    @IBOutlet weak var recipeCatecoryLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
=======
    @IBOutlet weak var recipeServingsLabel: UILabel!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeOwnerName: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeBgImg: UIImageView!
    var recipeID : Int!
    
>>>>>>> fav-core-data
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    @IBAction func favBtn(_ sender: UIButton) {
        
    }
}
