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
    
    
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.delegate(delegate: self)
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func addData(){
        
        var ref: DocumentReference? = nil
        ref = db.collection("name").addDocument(data: [
            "name": registerScreen?.nameTextField.text ?? ""
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}

extension RegisterViewController:RegisterScreenProtocol{
    func tappedBackButton() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tappedRegisterButton() {
        Auth.auth().createUser(withEmail: registerScreen?.emailTextField.text ?? "" , password: registerScreen?.passwordTextField.text ?? "") { authResult, error in
            if error != nil {
                print("erro ao cadastrar")
            }else{
                print("usuário cadastrado com sucesso")
                self.addData()
                self.navigationController?.popToRootViewController(animated: true)
            }
            
        }
    }
    
}

extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
