//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 28/09/22.
//

import UIKit
import FirebaseAuth

protocol RegisterScreenProtocol:AnyObject{
    func tappedRegisterButton()
    func tappedBackButton()
}

class RegisterScreen: UIView {
    
    
    private weak var delegate:RegisterScreenProtocol?
    
    func delegate(delegate:RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var logoAppImageView:UIImageView = {
        let img:UIImageView = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "person.badge.plus")
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var nameTextField:UITextField = {
        let textField:UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite o nome"
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        return textField
    }()
    
    lazy var emailTextField:UITextField = {
        let textField:UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite o e-mail"
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
    lazy var passwordTextField:UITextField = {
        let textField:UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Digite a senha"
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginButton:UIButton = {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(named: "buttonColor")
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton:UIButton = {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        button.layer.cornerRadius = 15.0
        button.setTitle("Já possui cadastro? Fazer login", for: .normal)
        button.setTitleColor(UIColor(named: "buttonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "arial", size: 15)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func tappedLoginButton(_ sender: UIButton){
        self.delegate?.tappedRegisterButton()
    }
    
    @objc private func tappedBackButton(_ sender:UIButton){
        self.delegate?.tappedBackButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.initItens()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(named: "colorDefault")
    }
    
    private func initItens(){
        self.addSubview(logoAppImageView)
        self.addSubview(emailTextField)
        self.addSubview(loginButton)
        self.addSubview(passwordTextField)
        self.addSubview(backButton)
        self.addSubview(nameTextField)
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        self.nameTextField.delegate = delegate
    }
    
    private func configConstraints(){
        
        NSLayoutConstraint.activate([
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 150),
            self.logoAppImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
            self.loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            self.backButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.backButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ])
    }
    
}
