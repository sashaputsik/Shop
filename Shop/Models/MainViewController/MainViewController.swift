import UIKit

final class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var cellReload: UIBarButtonItem!
    
    @IBOutlet weak var basketButton: UIBarButtonItem!
    public var shopItems = [Shop]()
    public var isCell = true
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        addItems()
        toolBarSettigns()
        cellReload.image = UIImage(named: "grid.png")
    }
    final private func addItems(){
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceT\(i).jpg", nameOfBrand: "Palace T\(i)", price: 50*1)
        shopItems.append(newItemPalace)}
        for i in 1...6{
        let newItemStone = Shop(imageName: "stoneP\(i).jpg", nameOfBrand: "Stone Island P\(i)", price: 100*2)
           shopItems.append(newItemStone)
        }
        let newItemStone1 = Shop(imageName: "stoneSS1.jpg", nameOfBrand: "Stone Island SS", price: 100*2)
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceSS\(i).jpg", nameOfBrand: "Palace SS\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        shopItems.append(newItemStone1)
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceJ\(i).jpg", nameOfBrand: "Palace J\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        for i in 1...2{
        let newItemStone = Shop(imageName: "stoneJ\(i).jpg", nameOfBrand: "Stone Island J\(i)", price: 100*2)
        shopItems.append(newItemStone)
          
        }
    }
    
    @IBAction func cellReloadAction(_ sender: UIBarButtonItem) {
        isCell = !isCell
        UIView.animate(withDuration: 1) {
            self.mainCollectionView.reloadData()
        }
        if isCell{
            cellReload.image = UIImage(named: "grid.png")
                   
        }
        else{
            cellReload.image = UIImage(named: "menu.png")
               }
    }
    @objc final private func tShirt(){
        title = "T-Shirt"
        shopItems.removeAll()
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceT\(i).jpg", nameOfBrand: "Palace T\(i)", price: 50*1)
        shopItems.append(newItemPalace)}
        mainCollectionView.reloadData()
    }
    @objc final private func pants(){
        title = "Pants"
        shopItems.removeAll()
        for i in 1...6{
        let newItemStone = Shop(imageName: "stoneP\(i).jpg", nameOfBrand: "Stone Island P\(i)", price: 100*2)
            shopItems.append(newItemStone)
        }
        mainCollectionView.reloadData()
      }
    @objc final private func sweatShirt(){
        title = "Sweatshirts"
        shopItems.removeAll()
        let newItemStone1 = Shop(imageName: "stoneSS1.jpg", nameOfBrand: "Stone Island SS", price: 100*2)
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceSS\(i).jpg", nameOfBrand: "Palace SS\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        shopItems.append(newItemStone1)
        mainCollectionView.reloadData()
      }
    @objc final private func jacket(){
        title = "Jacket"
        shopItems.removeAll()
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceJ\(i).jpg", nameOfBrand: "Palace J\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        for i in 1...2{
        let newItemStone = Shop(imageName: "stoneJ\(i).jpg", nameOfBrand: "Stone Island J\(i)", price: 100*2)
        shopItems.append(newItemStone)
        }
        mainCollectionView.reloadData()
        }
    @IBAction func backToMainView(_ unwind: UIStoryboardSegue) {
        guard let vc = unwind.source as? CompletedViewController else{return}
    }
    final private func toolBarSettigns(){
        var toolBarArray = [UIBarButtonItem]()
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = .black
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "tshirt.png"),
                                           style: .done, target: self,
                                           action: #selector(tShirt)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                           target: self,
                                           action: nil))
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "jacket.png"),
                                           style: .done, target: self,
                                           action: #selector(jacket)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                           target: self,
                                           action: nil))
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "pants.png"),
                                           style: .done, target: self,
                                           action: #selector(pants)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                           target: self,
                                           action: nil))
        let ss = UIBarButtonItem(image: UIImage(named: "sweatshirt.png"),
                                style: .done, target: self,
                                action:#selector(sweatShirt))
        toolBarArray.append(ss)
        toolbarItems = toolBarArray
    }
    }
