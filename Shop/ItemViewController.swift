import UIKit
import CoreData
class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfBrandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceStepper: UIStepper!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var imageName = ""
    var nameOfBrand = ""
    var price = 0
    var isHiddenToolBar = false
    var basketArray = [Basket]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if isHiddenToolBar{
            navigationController?.isToolbarHidden = false}else{
            navigationController?.isToolbarHidden = true
        }
        imageView.image = UIImage(named: imageName)
        nameOfBrandLabel.text = nameOfBrand
        priceLabel.text = "\(price)"
        totalPriceLabel.text = "\(price)"
        var items = [UIBarButtonItem]()
        let fixebleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                           target: self,
                                           action: nil)
        fixebleSpace.width = 120
        let addBasketItem = UIBarButtonItem(title: "Add to basket",
                                            style: .done, target: self,
                                            action: #selector(addBasket))
        addBasketItem.tintColor = .red
        items.append(fixebleSpace)
        items.append(addBasketItem)
        toolbarItems = items
        priceStepper.addTarget(self, action: #selector(totalPriceChange),
                               for: .valueChanged)
    }
    @objc func totalPriceChange(){
        totalPriceLabel.text = "\(price*Int(priceStepper.value))"
    }
    @objc func addBasket(){
        let alertController = UIAlertController(title: "Awesome!",
                                                message: "You goods added to basket",
                                                preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Nice",
                                       style: .default) { (action) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let segueBasketAction = UIAlertAction(title: "Basket",
                                              style: .default) { (alert) in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Basket") else{return}
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let item = Basket(context:context)
        item.nameOfBrand = self.nameOfBrand
        item.totalPrice = Double(self.price)*self.priceStepper.value
        item.number = Double(self.priceStepper.value)
        item.imageName = imageName
        do{
            try context.save()
        }catch
        let error as NSError
        {
            print(error)
            }
        print(basketArray)
        alertController.addAction(okeyAction)
        alertController.addAction(segueBasketAction)
               present(alertController, animated: true, completion: nil)
    }
}
