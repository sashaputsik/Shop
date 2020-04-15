import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    var shopItems = [Shop]()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        addItems()
        print(shopItems)
        var toolBarArray = [UIBarButtonItem]()
        navigationController?.isToolbarHidden = false
        toolBarArray.append(UIBarButtonItem(title: "T", style: .done, target: self, action: #selector(tShirt)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        toolBarArray.append(UIBarButtonItem(title: "J", style: .done, target: self, action: #selector(jacket)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        toolBarArray.append(UIBarButtonItem(title: "P", style: .done, target: self, action: #selector(pants)))
        toolBarArray.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        toolBarArray.append(UIBarButtonItem(title: "SS", style: .done, target: self, action:#selector(sweatShirt)))
        toolbarItems = toolBarArray
    }

    func addItems(){
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceT\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)}
        for i in 1...6{
        let newItemStone = Shop(imageName: "stoneP\(i).jpg", nameOfBrand: "Stone Island\(i)", price: 100*2)
           shopItems.append(newItemStone)
        }
        let newItemStone1 = Shop(imageName: "stoneSS1.jpg", nameOfBrand: "Stone Island2", price: 100*2)

        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceSS\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        shopItems.append(newItemStone1)
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceJ\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)
          
        }
        for i in 1...2{
        let newItemStone = Shop(imageName: "stoneJ\(i).jpg", nameOfBrand: "Stone Island\(i)", price: 100*2)
        shopItems.append(newItemStone)
          
        }
    }
    @IBAction func openMenu(_ sender: UIBarButtonItem) {
        
    }
   
    @objc func tShirt(){
        title = "T-Shirt"
        shopItems.removeAll()
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceT\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)}
        mainCollectionView.reloadData()
    }
    @objc func pants(){
        title = "Pants"
        shopItems.removeAll()
        for i in 1...6{
        let newItemStone = Shop(imageName: "stoneP\(i).jpg", nameOfBrand: "Stone Island\(i)", price: 100*2)
            shopItems.append(newItemStone)
        }
        mainCollectionView.reloadData()
      }
      
    @objc func sweatShirt(){
        title = "Sweatshirts"
        shopItems.removeAll()
        let newItemStone1 = Shop(imageName: "stoneSS1.jpg", nameOfBrand: "Stone Island2", price: 100*2)
       
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceSS\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)
        }
        shopItems.append(newItemStone1)
        mainCollectionView.reloadData()
      }
      @objc func jacket(){
        title = "Jacket"
        shopItems.removeAll()
        for i in 1...4{
        let newItemPalace = Shop(imageName: "palaceJ\(i).jpg", nameOfBrand: "Palace\(i)", price: 50*1)
        shopItems.append(newItemPalace)
            
        }
        for i in 1...2{
        let newItemStone = Shop(imageName: "stoneJ\(i).jpg", nameOfBrand: "Stone Island\(i)", price: 100*2)
        shopItems.append(newItemStone)
            
        }
        mainCollectionView.reloadData()
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
              return CGSize(width: 160, height: 186)
          }
    }
