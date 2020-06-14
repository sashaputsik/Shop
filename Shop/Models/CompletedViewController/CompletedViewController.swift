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
    var nameOfBrand = ""
    var totalPrice = 0
    var number = 0
    var name = ""
    var address = ""
    var phoneNumber = ""
    var basketArray = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Completed"
        navigationController?.isToolbarHidden = true
        frameAndLayer()
    }
    override func viewWillAppear(_ animated: Bool) {
        pushJson()
    }
   
    func pushJson(){
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else{ return}
             let session = URLSession.shared
             var request = URLRequest(url: url)
        let array = ["address":"\(address)",
                    "name":"\(name)",
                    "phoneNumber":"\(phoneNumber)",
            "totalprice":"\(totalPrice)", "order":basketArray] as [String : Any]
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
    func frameAndLayer(){
        backButton.layer.cornerRadius = 10
        backButton.layer.shadowOpacity = 0.5
        backButton.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
