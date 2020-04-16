//
//  CompletedViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 15.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Completed"
        navigationController?.isToolbarHidden = true
        imageView.frame = CGRect(x: 150, y: 800, width: 100, height: 100)
        imageView.image = UIImage(named: "green.png")
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: 150, y: 400, width: 100, height: 100)
        }
    }
    

}
