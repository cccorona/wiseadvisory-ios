//
//  ContactViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 29/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ContactViewController: UIViewController {
    @IBOutlet var backButton: UIButton?
    
    @IBOutlet weak var asuntoTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        backButton?.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        saveButton?.addTarget(self, action: #selector(createSession), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    @objc func createSession(){
        guard let asunto = asuntoTextField?.text else{
            return
        }
        guard let description = detailTextView?.text else{
            return
        }
        if !asunto.isEmpty && !description.isEmpty{
            MessageObject.sharedInstance.showMessage("Mensaje enviado con exito", title: "Advisor", accept: "Aceptar")
        }else{
            MessageObject.sharedInstance.showMessage("Favor de ingresar todos los datos", title: "Error", accept: "Aceptar")
        }
    }
}
