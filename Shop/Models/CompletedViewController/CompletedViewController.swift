//
//  CompletedViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 15.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit

class CompletedViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bbbb: UIButton!
    var nameOfBrand = ""
    var totalPrice = 0
    var number = 0
    var name = ""
    var address = ""
    var phoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        imageView.layer.add(pulse, forKey: "pulse")
        title = "Completed"
        backButton.layer.borderColor  = UIColor.black.cgColor
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = backButton.frame.height/2
        navigationController?.isToolbarHidden = true
        imageView.frame = CGRect(x: 150,
                                 y: 800,
                                 width: 100,
                                 height: 100)
        imageView.image = UIImage(named: "green.png")
        UIView.animate(withDuration: 1) {
            self.imageView.frame = CGRect(x: 150,
                                          y: 400,
                                          width: 100,
                                          height: 100)
        }
       
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else{ return}
             let session = URLSession.shared
             var request = URLRequest(url: url)
        let array = ["address":"\(address)",
                    "name":"\(name)",
                    "phoneNumber":"\(phoneNumber)",
                    "totalprice":"\(totalPrice)"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: array,
                                                         options: []) else{return}
        request.httpBody = httpBody
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { (data, response, error) in
            if let data = data{
                print(data)
                if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                    print(json)
                }
            }
        }.resume()
         }
    @IBAction func adasads(_ sender: UIButton) {
        let shake = CABasicAnimation(keyPath: "position")
               shake.duration = 0.1
               shake.repeatCount = 2
               shake.autoreverses = true
               
        let fromPoint = CGPoint(x: bbbb.frame.origin.x - 5, y: bbbb.frame.origin.y)
               let fromValue = NSValue(cgPoint: fromPoint)
               
        let toPoint = CGPoint(x: bbbb.frame.origin.x + 5, y: bbbb.frame.origin.y)
               let toValue = NSValue(cgPoint: toPoint)
               
               shake.fromValue = fromValue
               shake.toValue = toValue
               
        bbbb.layer.add(shake, forKey: "position")
      shake
    }
}
