import UIKit
import CoreData
class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var basketButton: UIButton!
    var imageName = ""
    var nameOfBrand = ""
    var price: Int?
    var isHiddenToolBar = false
    var basketArray = [Basket]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if isHiddenToolBar{
            basketButton.isHidden = false
        }
        else{
            basketButton.isHidden = true
        }
        navigationController?.isToolbarHidden = true
        imageView.image = UIImage(named: imageName)
        title = nameOfBrand
        guard let price = price else{return}
        priceLabel.text = "Price: $\(price)"
        basketButton.addTarget(self, action: #selector(addBasket), for: .touchUpInside)
        frameAndLayer()
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
                                              style: .default) {[weak self] (alert) in
            guard let self = self else{return}
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "Basket") as? BasketViewController else{return}
            vc.basketArray = self.basketArray
            self.navigationController?.pushViewController(vc,
                                                          animated: true)
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let item = Basket(context:context)
       
        item.price =  Double(price ?? 0)
        item.nameOfBrand = self.nameOfBrand
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
    func frameAndLayer(){
        basketButton.layer.cornerRadius = 5
        basketButton.layer.shadowOpacity = 0.5
        basketButton.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
