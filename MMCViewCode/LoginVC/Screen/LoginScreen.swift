//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 02/09/22.
//

import UIKit

protocol LoginScreenProtocol:AnyObject{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    private weak var delegate:LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 44)
        return label
    }()
    lazy var emailTextField:UITextField = {
        let textField:UITextField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o email"
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.layer.cornerRadius = 10
        textField.font = UIFont.boldSystemFont(ofSize: 16)
        textField.autocorrectionType = .no
        textField.textColor = .darkGray
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    lazy var logoAppImageView:UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
        
    }()
    
    lazy var passwordTextField:UITextField = {
        let textfield:UITextField = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Digite a senha"
        textfield.isSecureTextEntry = true
        textfield.layer.cornerRadius = 10
        textfield.font = UIFont.systemFont(ofSize: 16)
        textfield.backgroundColor = .white
        textfield.autocorrectionType = .no
        textfield.textColor = .darkGray
        textfield.clearButtonMode = .whileEditing
        return textfield
    }()
    
    lazy var loginButton:UIButton = {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 7.5
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.setTitle("Ainda não tem conta? Registre-se", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor(named: "buttonColor"), for: .normal)
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSuperview()
        self.configBackground()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(named: "colorDefault")
    }
    private func configSuperview(){
        self.addSubview(loginLabel)
        self.addSubview(emailTextField)
        self.addSubview(logoAppImageView)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate:UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
    }

    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()        
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoAppImageView.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.logoAppImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            self.logoAppImageView.widthAnchor.constraint(equalToConstant: 150),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 35),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.loginButton.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            
            self.registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.registerButton.heightAnchor.constraint(equalToConstant: 30),
            self.registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        
        
        ])
    }

}

