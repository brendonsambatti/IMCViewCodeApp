//
//  Alert.swift
//  IMCViewCode
//
//  Created by Brendon Sambatti on 30/09/22.
//

import Foundation
import UIKit

enum ActionType{
    case aceitar
    case cancel
}

class AlertController{
    
    var controller:UIViewController
    
    init(controller:UIViewController){
        self.controller = controller
    }
    //todas funcoes retornam void = nada (no caso de nao ser especificado ou explicito)
    //escaping = informando que o retorno é assincrono, ou seja, nao tem tempo de retorno especifico
    func showAlert(title:String,message:String,titleButton:String, titleCancel:String, completion:@escaping(_ value:ActionType)-> Void){
        //criar alertController
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //configurar acao dos botoes
        let ok = UIAlertAction(title: titleButton, style: .cancel) { alert in
            print("ok pressed")
            completion(.aceitar)
        }
        let cancel = UIAlertAction(title: titleCancel, style: .destructive) { alert in
            print("cancel pressed")
            completion(.cancel)
        }
        //add botao no alert
        alert.addAction(ok)
        alert.addAction(cancel)
        //apresentar allert
        self.controller.present(alert, animated: true)
    }
}
