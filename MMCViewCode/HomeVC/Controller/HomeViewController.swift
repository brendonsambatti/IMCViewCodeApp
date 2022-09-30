//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Brendon Sambatti on 28/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseCore

class HomeViewController: UIViewController {
    
    var homeScreen:HomeScreen?
    var firestore: Firestore?
    var auth: Auth?
    var idUserLog: String?
    let database = Firestore.firestore()
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
        self.homeScreen?.configDelegate(delegate: self)
        self.homeScreen?.configTextfieldDelegate(delegate: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.firestore = Firestore.firestore()
        self.auth = Auth.auth()
        if let idUser = auth?.currentUser?.uid{
            self.idUserLog = idUser
        }
        getUserName()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    public func getUserName(){
        let user = self.firestore?.collection("users").document(self.idUserLog ?? "")
        user?.getDocument(completion: { documentSnapshot, error in
            if error == nil{
                let data = documentSnapshot?.data()
                let dataName = data?["name"]
                self.homeScreen?.emailLabel.text = dataName as? String
            }
        } )
    }
    
    
    public func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let accept:UIAlertAction = UIAlertAction(title: "Aceitar", style: .cancel, handler: nil)
        alertController.addAction(accept)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func textResult(){
        let weightStr = homeScreen?.weightTextfield.text ?? ""
        let heightStr = homeScreen?.heightTextfield.text ?? ""
        let weightInt = Double(weightStr) ?? 0.0
        let heightInt = Double(heightStr) ?? 0.0
        let result:Double = (weightInt / (heightInt*heightInt))
        let formatted = String(format: "IMC é de: %.1f kg/m2", result)
        homeScreen?.IMCLabel.text = formatted
        
        if result <= 18.5 {
            homeScreen?.resultLabel.text = "Considerado: Magreza"
        }else if result > 18.5 && result <= 24.9{
            homeScreen?.resultLabel.text = "Considerado: Normal"
        }else if result > 24.5 &&  result <= 30{
            homeScreen?.resultLabel.text = "Considerado: Sobrepeso"
        }else if result > 30.0 {
            homeScreen?.resultLabel.text = "Considerado: Obesidade"
        }
    }
    
    private func moreInfoAlert(){
        if homeScreen?.resultLabel.text == "Considerado: Normal"{
            alert(title: "Resultado", message: "De acordo com a Organização Mundial da Saúde, seu IMC é considerado normal para a sua altura. Para manter o valor de IMC normal, seu peso pode variar entre 54.7 e 73.7 kg.")
        }else if homeScreen?.resultLabel.text == "Considerado: Magreza"{
            alert(title: "Resultado", message: "De acordo com a Organização Mundial da Saúde, seu IMC está abaixo do recomendado para a sua altura. Para atingir um valor de IMC normal, seu peso deve estar entre 54.7 e 73.7 kg.")
        }else if homeScreen?.resultLabel.text == "Considerado: Sobrepeso"{
            alert(title: "Resultado", message: "De acordo com a Organização Mundial da Saúde, seu IMC está acima do recomendado para a sua altura. Para atingir um valor de IMC normal, seu peso deve estar entre 54.7 e 73.7 kg.")
        }else if homeScreen?.resultLabel.text == "Considerado: Obesidade"{
            alert(title: "Resultado", message: "De acordo com a Organização Mundial da Saúde, seu IMC está acima do recomendado para a sua altura. Para atingir um valor de IMC normal, seu peso deve estar entre 54.7 e 73.7 kg.")
        }
    }
}
extension HomeViewController:HomeScreenProtocol{
    
    func moreInfoButton() {
        self.moreInfoAlert()
    }
    
    func calculateIMC() {
        self.textResult()
    }
    
}

extension HomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
