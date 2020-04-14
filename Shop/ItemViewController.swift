import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameOfBrandLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceStepper: UIStepper!
    @IBOutlet weak var totalPriceLabel: UILabel!
    var imageName = ""
    var nameOfBrand = ""
    var price = 0
    var basketArray = [Basket]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isToolbarHidden = false
        imageView.image = UIImage(named: imageName)
        nameOfBrandLabel.text = nameOfBrand
        priceLabel.text = "\(price)"
        totalPriceLabel.text = "\(price)"
        var items = [UIBarButtonItem]()
        let fixebleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        fixebleSpace.width = 120
        let addBasketItem = UIBarButtonItem(title: "Add to basket", style: .done, target: self, action: #selector(addBasket))
        addBasketItem.tintColor = .red
        items.append(fixebleSpace)
        items.append(addBasketItem)
        toolbarItems = items
        priceStepper.addTarget(self, action: #selector(totalPriceChange), for: .valueChanged)    }
    @objc func totalPriceChange(){
        totalPriceLabel.text = "\(price*Int(priceStepper.value))"

    }
   
    @objc func addBasket(){
        let alertController = UIAlertController(title: "Awesome!", message: "You goods added to basket", preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Nice", style: .default) { (action) in
            let itemToBasket = Basket(nameOfBrand: self.nameOfBrand, imageName: self.imageName, price: self.price, number: Int(self.priceStepper.value))
            self.basketArray.append(itemToBasket)
            print(self.basketArray)
        }
        alertController.addAction(okeyAction)
               present(alertController, animated: true, completion: nil)
    }

}
