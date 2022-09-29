//
//  Textfield.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 29/09/22.
//

import Foundation
import UIKit


// assinar o hideKeyboardWhenTappedAround no viewDidLoad
extension UIViewController {
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func dismissAllKeyboard() {
        DispatchQueue.main.async {
            for textField in self.view.subviews where textField is UITextField {
                textField.resignFirstResponder()
            }
        }
    }
    
}

public func textfieldStyle(textField:UITextField, color:UIColor){
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textField.frame.height, width: textField.frame.width, height: 2)
    bottomLine.backgroundColor = color.cgColor
    textField.backgroundColor = .clear
    textField.borderStyle = .none
    textField.layer.addSublayer(bottomLine)
}
