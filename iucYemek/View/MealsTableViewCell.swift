//
//  MealsTableViewCell.swift
//  iucYemek
//
//  Created by Eren Yavaş on 29.10.2023.
//

import UIKit

class MealsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mainMealLabel: UILabel!
    @IBOutlet weak var sideMealLabel: UILabel!
    @IBOutlet weak var soupMealLabel: UILabel!
    @IBOutlet weak var aperetiveLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
