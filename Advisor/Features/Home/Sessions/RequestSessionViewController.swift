//
//  RequestSessionViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 29/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class RequestSessionViewController: UIViewController {
    
    @IBOutlet private weak var asuntoTextField: SkyFloatingLabelTextField?
    @IBOutlet private weak var descriptionTextView: UITextView?
    @IBOutlet private weak var createButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        createButton?.addTarget(self, action: #selector(createSession), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func createSession(){
        guard let asunto = asuntoTextField?.text else{
            return
        }
        guard let description = descriptionTextView?.text else{
            return
        }
        if !asunto.isEmpty && !description.isEmpty{
            WebServices.shared().showLoading()
            WebServices.shared().requestSession(
                name: GlobalValues.shared.fullname,
                email: GlobalValues.shared.email,
                phone: GlobalValues.shared.telefone,
                message: description
            ) { (result) in
                WebServices.shared().hideLoading {
                    switch result{
                    case .success(let response):
                        MessageObject.sharedInstance.showMessage(response.Status ?? "Solicitud enviada", title: "Advisor", accept: "Aceptar")
                    case .failure(let error):
                        MessageObject.sharedInstance.showMessage(error.localizedDescription, title: "Error", accept: "Aceptar")
                    }
                }
            }
        }else{
            MessageObject.sharedInstance.showMessage("Favor de ingresar todos los datos", title: "Error", accept: "Aceptar")
        }
    }
}
