import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var cellReload: UIBarButtonItem!
    var shopItems = [Shop]()
    var isCell = true
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        addItems()
        print(shopItems)
        var toolBarArray = [UIBarButtonItem]()
        navigationController?.isToolbarHidden = false
        navigationController?.toolbar.tintColor = .black
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "tshirt.png"), style: .done, target: self, action: #selector(tShirt)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "jacket.png"), style: .done, target: self, action: #selector(jacket)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        toolBarArray.append(UIBarButtonItem(image: UIImage(named: "pants.png"), style: .done, target: self, action: #selector(pants)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        let ss = UIBarButtonItem(image: UIImage(named: "sweatshirt.png"), style: .done, target: self, action:#selector(sweatShirt))
        toolBarArray.append(ss)
        toolbarItems = toolBarArray
        cellReload.image = UIImage(named: "grid.png")
      
    }
    func addItems(){
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
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
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
   
    @objc func tShirt(){
        title = "T-Shirt"
        shopItems.removeAll()
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceT\(i).jpg", nameOfBrand: "Palace T\(i)", price: 50*1)
        shopItems.append(newItemPalace)}
        mainCollectionView.reloadData()
    }
    @objc func pants(){
        title = "Pants"
        shopItems.removeAll()
        for i in 1...6{
        let newItemStone = Shop(imageName: "stoneP\(i).jpg", nameOfBrand: "Stone Island P\(i)", price: 100*2)
            shopItems.append(newItemStone)
        }
        mainCollectionView.reloadData()
      }
      
    @objc func sweatShirt(){
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
      @objc func jacket(){
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
    }

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shopItems.count
       }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCollectionViewCell{
        let item = shopItems[indexPath.row]
        cell.reload(item)
            if isCell{
                UIView.animate(withDuration: 1) {
                    cell.imageView.frame = CGRect(x: 0, y: 0, width: 160, height: 155)
                    cell.label.frame = CGRect(x: 8, y: 163, width: 144, height: 21)
                    cell.priceLabel.frame = CGRect(x: 118, y: 8, width: 42, height: 21)
                }
            }
            else
            {
                UIView.animate(withDuration: 1) {
                    cell.imageView.frame = CGRect(x: 0, y: 0, width: 93, height: 70)
                    cell.label.frame = CGRect(x: 101, y: 25, width: 185, height: 21)
                    cell.priceLabel.frame = CGRect(x: 308, y: 8, width: 42, height: 21)
                }
            }
            return cell}
        return UICollectionViewCell()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard let vc = segue.destination as? ItemViewController else{return}
        if let indexPath = mainCollectionView.indexPathsForSelectedItems{
            if let last = indexPath.last{
        let item = shopItems[last.row]
        vc.imageName = item.imageName
        vc.price = item.price
        vc.nameOfBrand = item.nameOfBrand
            }}}
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isCell{
            return CGSize(width: 160, height: 186)
            
        }
        else{
            return CGSize(width: 358, height: 70)
        }
          }
    }
