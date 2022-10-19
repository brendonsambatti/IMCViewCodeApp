//
//  ResetPasswordViewController.swift
//  IMCViewCode
//
//  Created by Brendon Sambatti on 30/09/22.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    var resetPasswordScreen:ResetPasswordScreen?
    
    override func loadView() {
        self.resetPasswordScreen = ResetPasswordScreen()
        self.view = self.resetPasswordScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetPasswordScreen?.ResetPasswordDelegate(delegate: self)

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

extension ResetPasswordViewController:ResetPasswordProtocol{
    func sendEmail() {
        let email = self.resetPasswordScreen?.emailTextfield.text
        Auth.auth().sendPasswordReset(withEmail: email ?? "") { error in
            if error != nil{
                print("erro ao enviar email")
            }
        }
    }
    
    
}
