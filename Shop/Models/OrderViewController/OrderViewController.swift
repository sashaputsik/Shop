import CoreData
import UIKit

final class OrderViewController: UIViewController {
    public var name = ""
    public var address = ""
    public var phoneNumber = ""
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    public var basketArray = [Basket]()
    public var totalPrice = 0
    public var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        print(totalPrice)
        totalPriceLabel.text = ""
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.isToolbarHidden = false
        var toolBarArray = [UIBarButtonItem]()
        let fixebleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                           target: self,
                                           action: nil)
        fixebleSpace.width = 140
        toolBarArray.append(fixebleSpace)
        toolBarArray.append(UIBarButtonItem(title: "Completed",
                                            style: .done, target: self,
                                            action: #selector(completedOrder)))
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
        let alertController = UIAlertController(title: "Точно",
                                                message: "Вы уверены в своем заказе",
                                                preferredStyle: .actionSheet)
        let yes = UIAlertAction(title: "Yes",
                                style: .default) { (alert) in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "completed") as? CompletedViewController else{return}
            let appDeleagate = UIApplication.shared.delegate as! AppDelegate
            let context = appDeleagate.persistentContainer.viewContext
                                    for item in self.basketArray{
                                        vc.basketArray.append(["\(item.nameOfBrand!)":item.price])
                                }
            vc.totalPrice = self.totalPrice
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
            vc.name = self.name
            vc.phoneNumber = self.phoneNumber
            vc.address = self.address
            self.show(vc, sender: nil)
        }
        let no = UIAlertAction(title: "No",
                               style: .cancel) {(alert) in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Basket") else {return}
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertController.view.tintColor = .black
        alertController.view.layer.cornerRadius = 0
        alertController.view.backgroundColor = #colorLiteral(red: 1, green: 0.9889082191, blue: 0.7261312769, alpha: 1)
        alertController.addAction(yes)
        alertController.addAction(no)
        present(alertController, animated: true, completion: nil)
    }
}
