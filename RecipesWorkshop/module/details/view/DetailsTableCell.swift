//
//  DetailsTableCell.swift
//  RecipesWorkshop
//
//  Created by JETS Mobile Lab4 on 27/05/2023.
//

import UIKit

class DetailsTableCell: UITableViewCell {
    
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
