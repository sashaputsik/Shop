import Foundation
import UIKit


extension BasketViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                    for: indexPath) as? BasketTableViewCell{
            let item = basketArray[indexPath.row]
            cell.nameOfBrandLabel.text = item.nameOfBrand
            if let imageName = item.imageName{
            cell.itemImageView.image = UIImage(named: imageName)}
            cell.priceLabel.text = "\(Int(item.price))"
            return cell
        }
        return UITableViewCell()
    }
}
extension BasketViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let item = basketArray[indexPath.row]
            context.delete(item)
            basketArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            do{
                try context.save()
            }catch
                let error as NSError{
                    print(error)
            }
        }
    }
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
}

