//
//  ItemViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 13.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfBrandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    var imageName = ""
    var nameOfBrand = ""
    var price = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageName)
        nameOfBrandLabel.text = nameOfBrand
        priceLabel.text = "\(price)"
    }
    @IBAction func addToBasket(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Awesome!", message: "You goods added to basket", preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
        alertController.addAction(okeyAction)
        present(alertController, animated: true, completion: nil)
    }



}
