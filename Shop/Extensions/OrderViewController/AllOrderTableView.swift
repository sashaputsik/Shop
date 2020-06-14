import Foundation
import UIKit
extension OrderViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        let item = basketArray[indexPath.row]
        cell.textLabel?.text = item.nameOfBrand
        cell.detailTextLabel!.text = "Price: $\(Int(item.price))"
        totalPriceLabel.text = "Total price: \(totalPrice)"
        return cell
    }
}
extension OrderViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
