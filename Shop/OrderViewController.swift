//
//  OrderViewController.swift
//  Shop
//
//  Created by Sasha Putsikovich on 15.04.2020.
//  Copyright © 2020 Sasha Putsikovich. All rights reserved.
//

import UIKit
import CoreData
class OrderViewController: UIViewController {

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var basketArray = [Basket]()
    var totalPrice = 0
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        print(totalPrice)
        totalPriceLabel.text = ""
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.isToolbarHidden = false
        var toolBarArray = [UIBarButtonItem]()
        let fixebleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        fixebleSpace.width = 140
        toolBarArray.append(fixebleSpace)
        toolBarArray.append(UIBarButtonItem(title: "Completed", style: .done, target: self, action: #selector(completedOrder)))
        toolbarItems = toolBarArray
    }
    override func viewWillAppear(_ animated: Bool) {
       
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetch = Basket.fetchRequest() as NSFetchRequest<Basket>
        do {
            basketArray = try context.fetch(fetch)
        } catch let error as NSError {
            print(error)
        }
        
        
        tableView.reloadData()
    }
    
    @objc func completedOrder(){
        let alertController = UIAlertController(title: "Точчно", message: "Вы уверены в своем заказе", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { (alert) in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "completed") else{return}
            let appDeleagate = UIApplication.shared.delegate as! AppDelegate
            let context = appDeleagate.persistentContainer.viewContext
            for item in self.basketArray{
            context.delete(item)
            }
            self.basketArray.removeAll()
            do{
                try context.save()}
            catch
            let error as NSError{
                print(error)
            }
            self.show(vc, sender: nil)
        }
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(yes)
        alertController.addAction(no)
        present(alertController, animated: true, completion: nil)
    }

}
extension OrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = basketArray[indexPath.row]
        cell.textLabel?.text = item.nameOfBrand
        cell.detailTextLabel!.text = "\(Int(item.totalPrice))"
        totalPriceLabel.text = "Total price: \(totalPrice)"
        return cell
    }
    
    
}
extension OrderViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
