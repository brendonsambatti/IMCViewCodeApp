//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 28/09/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var registerScreen:RegisterScreen?
    let db = Firestore.firestore()
    var auth: Auth?
    var firestore: Firestore?
    
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenDelegate()
        hideKeyboardWhenTappedAround()
        self.instantiateFirebase()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func screenDelegate(){
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
    }
    
    private func instantiateFirebase(){
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
    }
    
    private func registerUser(){
        if let name = self.registerScreen?.nameTextField.text, let email = self.registerScreen?.emailTextField.text, let password = self.registerScreen?.passwordTextField.text{
            auth?.createUser(withEmail: email, password: password) { (data, error) in
                if error == nil{
                    if let idUser = data?.user.uid{
                        self.firestore?.collection("users")
                            .document( idUser )
                            .setData([
                                "name": name,
                                "email": email,
                                "id": idUser,
                            ])
                    }
                }
            }
            print("usuário cadastrado com sucesso")
            self.navigationController?.popToRootViewController(animated: true)
        }else{
            print("Error")
        }
    }
}

extension RegisterViewController:RegisterScreenProtocol{
    func tappedBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        self.registerUser()
    }
}

extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
