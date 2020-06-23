import UIKit
import FirebaseAuth
import FirebaseFirestore
import SwiftKeychainWrapper
class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }
    @IBAction func signUp(_ sender: UIButton) {
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            guard let mail = emailTextField.text else{return}
            if mail.contains("@") {
                guard let email = emailTextField.text else{return}
                guard let password = passwordTextField.text else{return}
                Auth.auth().createUser(withEmail: email,
                                       password: password) { [weak self] (result, error) in
                guard let self = self else{return}
                if error == nil{
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuView") else{return}
                    guard let userUid = result?.user.uid else{return}
                    KeychainWrapper.standard.set(userUid,
                                                 forKey: "uid")
                    Firestore.firestore().collection("users").document(mail).setData(["mail":mail,
                    "password":password,
                    "basket": []])
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                else{
                    guard let error = error else{return}
                    print(error)
                    let alertController = UIAlertController(title: "Message",
                                                            message: error.localizedDescription,
                                                            preferredStyle: .actionSheet)
                    let okAction = UIAlertAction(title: "Okey",
                                                 style: .default,
                                                 handler: nil)
                    alertController.addAction(okAction)
                    self.present(alertController,
                                 animated: true,
                                 completion: nil)
                }
                }
            }
        }
    }
    


}
