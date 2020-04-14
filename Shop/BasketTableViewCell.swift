//
//  BasketTableViewCell.swift
//  Shop
//
//  Created by Sasha Putsikovich on 14.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

   
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameOfBrandLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func reload(_ item: Basket){
        itemImageView.image = UIImage(named: item.imageName)
        nameOfBrandLabel.text = item.nameOfBrand
        numberLabel.text = "\(item.number)"
        totalPriceLabel.text = "\(item.price)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
