import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var basketArray = [Basket]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print(basketArray)
    }
}

extension BasketViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BasketTableViewCell{
            let item = basketArray[indexPath.row]
            cell.reload(item)
            return cell
        }
        return UITableViewCell()
    }
    
    
    
}
extension BasketViewController: UITableViewDelegate{
    
    
}
