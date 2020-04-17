//
//  InfoViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 17.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var totalPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()

       let tapScreen = UITapGestureRecognizer(target: self, action: #selector(keyboardIsHidden))
       
        view.addGestureRecognizer(tapScreen)
    }
    
    @objc func keyboardIsHidden(){
        nameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        phoneNumberTextField.resignFirstResponder()
    }
    @IBAction func goToOrderView(_ sender: UIButton) {
        if nameTextField.text != "" && addressTextField.text != ""{
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "order") as? OrderViewController else {return}
            vc.totalPrice = totalPrice
            vc.name = nameTextField.text!
            vc.address = addressTextField.text!
            vc.phoneNumber = phoneNumberTextField.text!
            show(vc, sender: nil)
        }
        else{
            
        }
    }
    

}
