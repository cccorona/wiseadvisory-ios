//
//  BillingViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class BillingViewController: UIViewController {

    @IBOutlet weak var socialTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var rfcTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var directionFiscalTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var cfdiTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var bankTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var clabeTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var locationTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var stateTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var cityTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var postalCodeTxtField: SkyFloatingLabelTextField!
    @IBOutlet weak var saveButton: UIButton!
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        fillInformation()
    }
    
    func setupUI(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        socialTxtField.delegate = self
        rfcTxtField.delegate = self
        directionFiscalTxtField.delegate = self
        cfdiTxtField.delegate = self
        bankTxtField.delegate = self
        clabeTxtField.delegate = self
        locationTxtField.delegate = self
        stateTxtField.delegate = self
        cityTxtField.delegate = self
        postalCodeTxtField.delegate = self
        saveButton.addTarget(self, action: #selector(updateBilling), for: .touchUpInside)
    }
    
    func fillInformation(){
        socialTxtField?.text = GlobalValues.shared.razonSocial
        rfcTxtField?.text = GlobalValues.shared.rfc
        directionFiscalTxtField?.text = GlobalValues.shared.direction
        cfdiTxtField?.text = GlobalValues.shared.cfdi
        bankTxtField?.text = GlobalValues.shared.bank
        clabeTxtField?.text = GlobalValues.shared.clabe
        locationTxtField?.text = GlobalValues.shared.colonia
        stateTxtField?.text = GlobalValues.shared.state
        cityTxtField?.text = GlobalValues.shared.city
        postalCodeTxtField?.text = GlobalValues.shared.cp
    }

    @objc func keyboardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            if self.view.frame.origin.y == 0 {
//                self.view.frame.origin.y -= keyboardSize.height  - NavigationMenuBaseController.tabBarHeight
//            }
//        }
//
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
          return
        }

        var shouldMoveViewUp = false
        if let activeTextField = activeTextField {
          let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
          let topOfKeyboard = self.view.frame.height - keyboardSize.height + NavigationMenuBaseController.tabBarHeight
          if bottomOfTextField > topOfKeyboard {
            shouldMoveViewUp = true
          }
        }

        if(shouldMoveViewUp) {
          self.view.frame.origin.y = 0 - keyboardSize.height  +  NavigationMenuBaseController.tabBarHeight
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func updateBilling(){
        WebServices.shared().updateBilling(
            user_id: GlobalValues.shared.user_id,
            razon_social: socialTxtField.text,
            rfc: rfcTxtField.text,
            direccion: directionFiscalTxtField.text,
            codigo_postal: postalCodeTxtField.text,
            ciudad: cityTxtField.text,
            delegacion: stateTxtField.text,
            colonia: locationTxtField.text,
            uso_cfdi: cfdiTxtField.text,
            //tarjeta: <#T##String#>,
            bank: bankTxtField.text,
            clabe: clabeTxtField.text)
        { (result) in
            switch result{
            case .success(let account):
                self.handleSuccess(account: account)
            case .failure(let error):
                MessageObject.sharedInstance.showMessage(error.localizedDescription, title: "Error", accept: "Aceptar")
            }
        }
    }
    
    func handleSuccess(account: LoginResponse){
        if let status = account.Status{
            MessageObject.sharedInstance.showMessage(status, title: "Error", accept: "Aceptar")
            return
        }
        MessageObject.sharedInstance.showMessage("Información guardada exitosamente", title: "Advisor", accept: "Aceptar")
        GlobalValues.shared.user = account
        //fillInformation()
    }
}

extension BillingViewController : UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.activeTextField = textField
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}
