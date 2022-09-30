//
//  HomeScreen.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 28/09/22.
//

import UIKit

protocol HomeScreenProtocol:AnyObject{
    func calculateIMC()
    func moreInfoButton()
    
}

class HomeScreen: UIView {
    
    var delegate:HomeScreenProtocol?
    
    func configDelegate(delegate:HomeScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var userImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(systemName: "person.circle")
        img.tintColor = .white
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var emailLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    lazy var weightLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite seu peso:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    lazy var heightLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Digite sua altura:"
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    lazy var resultLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    lazy var weightTextfield:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Kg"
        textfield.text = "69.0"
        textfield.autocorrectionType = .no
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    lazy var heightTextfield:UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .white
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Altura"
        textfield.text = "1.72"
        textfield.autocorrectionType = .no
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    lazy var calculateButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.backgroundColor = UIColor(named: "buttonColor")
        button.layer.cornerRadius = 10.0
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    lazy var moreInfoButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Mais informações", for: .normal)
        button.addTarget(self, action: #selector(tappedMoreinfoButton), for: .touchUpInside)
        return button
    }()
    
    lazy var IMCLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.textAlignment = .center
        return label
    }()
    
    @objc private func tappedCalculateButton(_ sender:UIButton){
        self.delegate?.calculateIMC()
    }
    
    @objc private func tappedMoreinfoButton(_ sender:UIButton){
        self.delegate?.moreInfoButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.setupItens()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackground(){
        self.backgroundColor =  UIColor(named: "colorDefault")
        
    }
    
    public func configTextfieldDelegate(delegate:UITextFieldDelegate){
        self.heightTextfield.delegate = delegate
        self.weightTextfield.delegate = delegate
    }
    
    private func setupItens(){
        self.addSubview(userImage)
        self.addSubview(emailLabel)
        self.addSubview(weightLabel)
        self.addSubview(weightTextfield)
        self.addSubview(heightLabel)
        self.addSubview(heightTextfield)
        self.addSubview(resultLabel)
        self.addSubview(calculateButton)
        self.addSubview(IMCLabel)
        self.addSubview(moreInfoButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.userImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.userImage.heightAnchor.constraint(equalToConstant: 150),
            self.userImage.widthAnchor.constraint(equalToConstant: 100),
            self.userImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            self.userImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            self.userImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: self.userImage.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.emailLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.emailLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.weightLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 40),
            self.weightLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.weightLabel.widthAnchor.constraint(equalToConstant: 200),
            
            self.weightTextfield.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 40),
            self.weightTextfield.leftAnchor.constraint(equalTo: self.weightLabel.rightAnchor, constant: 10),
            self.weightTextfield.widthAnchor.constraint(equalToConstant: 80),
            
            self.heightLabel.topAnchor.constraint(equalTo: self.weightTextfield.bottomAnchor, constant: 20),
            self.heightLabel.leadingAnchor.constraint(equalTo: self.weightLabel.leadingAnchor),
            self.heightLabel.trailingAnchor.constraint(equalTo: self.weightLabel.trailingAnchor),
            self.heightLabel.centerXAnchor.constraint(equalTo: self.weightLabel.centerXAnchor),
            
            self.heightTextfield.topAnchor.constraint(equalTo: self.weightTextfield.bottomAnchor, constant: 20),
            self.heightTextfield.leadingAnchor.constraint(equalTo: self.weightTextfield.leadingAnchor),
            self.heightTextfield.trailingAnchor.constraint(equalTo: self.weightTextfield.trailingAnchor),
            self.heightTextfield.centerXAnchor.constraint(equalTo: self.weightTextfield.centerXAnchor),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.heightTextfield.bottomAnchor, constant: 20),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.calculateButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            self.IMCLabel.topAnchor.constraint(equalTo: self.calculateButton.bottomAnchor, constant: 10),
            self.IMCLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.IMCLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.IMCLabel.centerXAnchor.constraint(equalTo: self.calculateButton.centerXAnchor),
            
            self.resultLabel.topAnchor.constraint(equalTo: self.IMCLabel.bottomAnchor, constant: 30),
            self.resultLabel.leadingAnchor.constraint(equalTo: self.IMCLabel.leadingAnchor),
            self.resultLabel.trailingAnchor.constraint(equalTo: self.IMCLabel.trailingAnchor),
            self.resultLabel.centerXAnchor.constraint(equalTo: self.IMCLabel.centerXAnchor),
            
            self.moreInfoButton.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: 20),
            self.moreInfoButton.leadingAnchor.constraint(equalTo: self.IMCLabel.leadingAnchor, constant: 30),
            self.moreInfoButton.trailingAnchor.constraint(equalTo: self.IMCLabel.trailingAnchor, constant: -30),
            self.moreInfoButton.centerXAnchor.constraint(equalTo: self.IMCLabel.centerXAnchor),
            
            
        ])
    }
    
}
