//
//  ProfileViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import Kingfisher
import SkyFloatingLabelTextField

class ProfileViewController: BaseViewController {
    
    @IBOutlet private weak var profileImage: UIImageView?
    @IBOutlet private weak var profileName: UILabel?
    @IBOutlet private weak var profileDirection: UILabel?
    @IBOutlet private weak var userNameTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var emailTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var birthdayTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var phoneTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var enterpriceTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var linkedinTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var experticeTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var areaDomainTxtField: SkyFloatingLabelTextField?
    @IBOutlet private weak var coverImageView: UIImageView?
    
    @IBOutlet private weak var saveButton: UIButton?
    //@IBOutlet private weak var areaDomainTxtField: SkyFloatingLabelTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        fillInformation()
    }
    
    func fillInformation(){
        if let picture = GlobalValues.shared.user?.picture , let url = URL.init(string: "https:"+picture) {
            profileImage?.kf.setImage(with: url, placeholder: UIImage(named: "guy") )
        }
        profileName?.text = GlobalValues.shared.fullname
        profileDirection?.text = GlobalValues.shared.address
        userNameTxtField?.text = GlobalValues.shared.fullname
        emailTxtField?.text = GlobalValues.shared.email
        birthdayTxtField?.text = GlobalValues.shared.birthday
        phoneTxtField?.text = GlobalValues.shared.telefone
        enterpriceTxtField?.text = GlobalValues.shared.empresa
        linkedinTxtField?.text = GlobalValues.shared.linkedin
        experticeTxtField?.text = GlobalValues.shared.expertice
        areaDomainTxtField?.text = GlobalValues.shared.areaDomain
    }
    
    private func setupUI(){
        profileImage?.makeCircle()
        saveButton?.addTarget(self, action: #selector(updateUser), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - NavigationMenuBaseController.tabBarHeight
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func updateUser(){
        guard let email = emailTxtField?.text else{
            MessageObject.sharedInstance.showMessage("Favor de agregar un correo valido", title: "Error", accept: "Aceptar")
            return
        }
        var birthday: String? = nil
        if let cumpleaños = birthdayTxtField?.text {
            birthday = cumpleaños
        }
        
        
        WebServices.shared().updateUser(
            id: GlobalValues.shared.user_id,
            email: email,
            fullname: userNameTxtField?.text,
            empresa: enterpriceTxtField?.text,
            telefone: phoneTxtField?.text,
            //picture: <#T##String#>,
            //cover: <#T##String#>,
            expertise: experticeTxtField?.text,
            //tags: <#T##String#>,
            //twitter_link: <#T##String#>,
            //facebook_link: <#T##String#>,
            linkedin_link: linkedinTxtField?.text,
            //instagram_link: <#T##String#>,
            //address: <#T##String#>,
            //city: <#T##String#>,
            //cp: <#T##String#>,
            birthday: birthday
        ) { (result) in
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
