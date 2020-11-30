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
    }
    
    func setupUI(){
        createButton?.addTarget(self, action: #selector(createSession), for: .touchUpInside)
    }
    
    @objc func createSession(){
        guard let asunto = asuntoTextField?.text else{
            return
        }
        guard let description = descriptionTextView?.text else{
            return
        }
        if !asunto.isEmpty && !description.isEmpty{
            MessageObject.sharedInstance.showMessage("Favor de ingresar todos los datos", title: "Error", accept: "Aceptar")
        }else{
            MessageObject.sharedInstance.showMessage("Tu solicitud se ha generado correctamente, en un par de horas nuestro equipo se pondra en contacto contigo", title: "Advisor", accept: "Aceptar")
        }
    }
}
