//
//  ResetPasswordScreen.swift
//  MMCViewCode
//
//  Created by Brendon Sambatti on 30/09/22.
//

import UIKit

protocol ResetPasswordProtocol{
    func sendEmail()
}

class ResetPasswordScreen: UIView {
    
    var delegate:ResetPasswordProtocol?
    
    public func ResetPasswordDelegate(delegate:ResetPasswordProtocol){
        self.delegate = delegate
    }
    
    lazy var resetPasswordLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recuperar senha"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    lazy var passwordImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "person.badge.key.fill")
        img.contentMode = .scaleAspectFit
        img.tintColor = .white
        return img
    }()
    
    lazy var emailTextfield:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Digite seu e-mail"
        textfield.autocorrectionType = .no
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    lazy var sendButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 7.5
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func tappedSendButton(){
        self.delegate?.sendEmail()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.addViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configBackground(){
        self.backgroundColor = UIColor(named: "colorDefault")
    }
    
    private func addViews(){
        self.addSubview(resetPasswordLabel)
        self.addSubview(passwordImage)
        self.addSubview(emailTextfield)
        self.addSubview(sendButton)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.resetPasswordLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.resetPasswordLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.passwordImage.topAnchor.constraint(equalTo: self.resetPasswordLabel.bottomAnchor, constant: 5),
            self.passwordImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.passwordImage.widthAnchor.constraint(equalToConstant: 150),
            self.passwordImage.heightAnchor.constraint(equalToConstant: 150),
            
            self.emailTextfield.topAnchor.constraint(equalTo: self.passwordImage.bottomAnchor, constant: 10),
            self.emailTextfield.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.emailTextfield.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        
            self.sendButton.topAnchor.constraint(equalTo: self.emailTextfield.bottomAnchor, constant: 15),
            self.sendButton.heightAnchor.constraint(equalTo: self.emailTextfield.heightAnchor),
            self.sendButton.trailingAnchor.constraint(equalTo: self.emailTextfield.trailingAnchor),
            self.sendButton.leadingAnchor.constraint(equalTo: self.emailTextfield.leadingAnchor),
        
        
        ])
    }
    
}
