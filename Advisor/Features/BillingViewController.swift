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
    var activeTextField : UITextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
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

}

extension BillingViewController : UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.activeTextField = textField
  }

  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}
