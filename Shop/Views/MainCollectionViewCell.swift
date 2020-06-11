import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func reload(_ shopItem: Shop){
        imageView.image = UIImage(named:"\(shopItem.imageName)")
        label.text = shopItem.nameOfBrand
        priceLabel.text = "$\(shopItem.price)"
    }
   
}
