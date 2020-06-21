import UIKit
import FirebaseAuth
import SwiftKeychainWrapper
class MainViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func loginOrSignUp(_ sender: UIButton) {
        guard let email = emailAddressTextField.text else{return}
        guard let password = passwordTextField.text else{return}
        Auth.auth().signIn(withEmail: email,
                           password: password) { [weak self] (result, error) in
            guard let self = self else{return}
            if error == nil{
                guard let userUid = result?.user.email else{return}
                KeychainWrapper.standard.set(userUid,
                                             forKey: "uid")
                self.performSegue(withIdentifier: "MenuView",
                                  sender: nil)
            }
            else{
                guard let error = error else{return}
                let alertController = UIAlertController(title: "Message", message: error.localizedDescription, preferredStyle: .actionSheet)
                let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alertController.addAction(okeyAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        guard let email = emailAddressTextField.text else{return}
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                let alertController = UIAlertController(title: "Message", message: "Password reset", preferredStyle: .actionSheet)
                alertController.view.layer.cornerRadius = 0
                alertController.view.tintColor = .lightGray
                let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alertController.addAction(okeyAction)
                self.present(alertController, animated: true, completion: nil)
                self.navigationController?.popToRootViewController(animated: true)
            }else{
                guard let error = error else{return}
                let alertController = UIAlertController(title: "Message", message: error.localizedDescription, preferredStyle: .actionSheet)
                alertController.view.layer.cornerRadius = 0
                alertController.view.tintColor = .lightGray
                let okeyAction = UIAlertAction(title: "Okey", style: .default, handler: nil)
                alertController.addAction(okeyAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}
