//
//  LoginViewController.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 02/09/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var loginScreen:LoginScreen?
    
    override func loadView() {
    self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        hideKeyboardWhenTappedAround()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.backBarButtonItem?.style = .plain
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = UIColor(named: "buttonColor")
    }
    
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.backgroundColor = .white
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.borderStyle = .none
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.clear.cgColor
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

extension LoginViewController:LoginScreenProtocol{
    func actionLoginButton() {
        print("protocol login button")
        Auth.auth().signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.passwordTextField.text ?? "") { [weak self] authResult, error in
            if error == nil{
                let vC = HomeViewController()
                self?.navigationController?.pushViewController(vC, animated: true)
            }else{
                print("Usuário não localizado")
            }
        }

    }
    
    func actionRegisterButton() {
        print("protocol register button")
        let RegisterVC = RegisterViewController()
        self.navigationController?.pushViewController(RegisterVC, animated: true)

    }
    
    
}
