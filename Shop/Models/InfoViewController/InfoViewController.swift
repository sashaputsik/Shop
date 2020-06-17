import UIKit

final class InfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    public var totalPrice = 0
    @IBOutlet weak var completedOrderButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        frameAndLayer() 
        navigationController?.isToolbarHidden = true
        nameTextField.delegate = self
        addressTextField.delegate = self
        phoneNumberTextField.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isToolbarHidden = false
    }
    @IBAction func goToOrderView(_ sender: UIButton) {
        if nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && addressTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "order") as? OrderViewController else {return}
            vc.totalPrice = totalPrice
            vc.name = nameTextField.text!
            vc.address = addressTextField.text!
            vc.phoneNumber = phoneNumberTextField.text!
            show(vc,
                 sender: nil)
        }
        else{
            let alertController = UIAlertController(title: "Message", message: "Empty field. Заполните их!", preferredStyle: .actionSheet)
            let okeyAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.view.tintColor = .black
            alertController.addAction(okeyAction)
            present(alertController, animated: true, completion: nil)
        }
    }
   private func frameAndLayer(){
    completedOrderButton.layer.cornerRadius = 10
    completedOrderButton.layer.shadowOpacity = 0.5
    completedOrderButton.layer.shadowOffset = CGSize(width: 1, height: 1)
    completedOrderButton.layer.shadowColor = UIColor.lightGray.cgColor
    }
}
