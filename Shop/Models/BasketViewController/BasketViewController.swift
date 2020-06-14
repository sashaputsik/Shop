import UIKit
import CoreData
class BasketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var basketArray = [Basket]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
        tableView.delegate = self
        tableView.dataSource = self
        print(basketArray)
        var toolBarArray = [UIBarButtonItem]()
        let fixebleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                           target: self,
                                           action: nil)
        fixebleSpace.width = 150
        toolBarArray.append(fixebleSpace)
        toolBarArray.append(UIBarButtonItem(title: "Order",
                                            style: .done,
                                            target: self,
                                            action: #selector(order)))
        toolbarItems = toolBarArray
    }
    @objc func order(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "info") as? InfoViewController else {return}
        for item in basketArray{
            vc.totalPrice += Int(item.price)
        }
        show(vc, sender: self)
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
        if basketArray.count == 0 {
            tableView.isHidden = true
            navigationController?.isToolbarHidden = true
            let infoLabel = UILabel()
            infoLabel.frame = CGRect(x: view.frame.midX,
                                     y: view.frame.midY,
                                     width: 300,
                                     height: 70)
            infoLabel.center = view.center
            infoLabel.numberOfLines = 0
            infoLabel.textAlignment = .center
            infoLabel.textColor = .lightGray
            infoLabel.font = UIFont(name: "Futura-Bold", size: 17)
            infoLabel.text = "You'r basket empty. Add someone and order."
            view.addSubview(infoLabel)
        }
    }
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        guard let vc = segue.destination as? ItemViewController else{return}
        if let indexPath = tableView.indexPathForSelectedRow{
            let item = basketArray[indexPath.row]
            vc.imageName = item.imageName!
            vc.price = Int(item.price)
            vc.nameOfBrand = item.nameOfBrand!
            vc.isHiddenToolBar = false
               }
    }
}
