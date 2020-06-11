import Foundation
import UIKit

extension MainViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return shopItems.count
       }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                         for: indexPath) as? MainCollectionViewCell{
            cell.contentView.layer.cornerRadius = 10
            cell.layer.cornerRadius = 10
            cell.layer.shadowOffset = CGSize(width: 1, height: 1)
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            let item = shopItems[indexPath.row]
            cell.reload(item)
        
            if isCell{
                cell.imageView.frame = CGRect(x: 0,
                                              y: 0,
                                              width: 158,
                                              height: 144)
                cell.label.frame = CGRect(x: 12,
                                          y: 166,
                                          width: 134,
                                          height: 26)
                cell.priceLabel.frame = CGRect(x: 8,
                                               y: 142,
                                               width: 134,
                                               height: 22)
            }
            else{
                cell.imageView.frame = CGRect(x: 0,
                                              y: 0,
                                              width: 93,
                                              height: 70)
                cell.label.frame = CGRect(x: 101,
                                          y: 25,
                                          width: 185,
                                          height: 21)
                cell.priceLabel.frame = CGRect(x: 265,
                                               y: 8,
                                               width: 85,
                                               height: 23)
            }
            return cell
        }
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
        vc.isHiddenToolBar = true
            }}}
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isCell{
            return CGSize(width: 158, height: 200)
        }
        else{
            return CGSize(width: 358, height: 70)
        }
          }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    }

