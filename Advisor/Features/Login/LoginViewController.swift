//
//  LoginViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 27/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var usernameTextField: SkyFloatingLabelTextField?
    @IBOutlet private weak var passwordTextField: SkyFloatingLabelTextField?
    @IBOutlet private weak var signInButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setup(){
        signInButton?.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        usernameTextField?.text = Credential.shared.getLastAccount()
        passwordTextField?.text = Credential.shared.getLastCredential()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }

    @objc func signInAction(){
        guard let username = usernameTextField?.text else{
            return
        }
        guard let password = passwordTextField?.text else{
            return
        }
        if username.isEmpty || password.isEmpty{
            MessageObject.sharedInstance.showMessage("Favor de ingresar todos los datos", title: "Error", accept: "Aceptar")
            return
        }
        WebServices.shared().showLoading()
        WebServices.shared().loginUser(username, pass: password) { (result) in
            switch result{
            case .success(let account):
                self.handleSuccess(account: account)
            case .failure(let error):
                WebServices.shared().hideLoading{
                    MessageObject.sharedInstance.showMessage(error.localizedDescription, title: "Error", accept: "Aceptar")
                }
            }
        }
    }
    
    func handleSuccess(account: LoginResponse){
        if let status = account.Status{
            WebServices.shared().hideLoading {
                MessageObject.sharedInstance.showMessage(status, title: "Error", accept: "Aceptar")
            }
            return
        }
        GlobalValues.shared.user = account
        Credential.shared.saveLastAccount(
            account: usernameTextField!.text!,
            credential: passwordTextField!.text!
        )
        loadSessions()
    }
    
    func loadSessions(){
        WebServices.shared().getNextSessions(
            user_id: GlobalValues.shared.user_id) { (result) in
            switch result{
            case .success(let sessions):
                self.handleSuccess(sessions)
            case .failure(_):
                WebServices.shared().hideLoading{
                    self.performSegue(withIdentifier: "homeSegue", sender: nil)
                }
            }
        }
    }
    
    func handleSuccess(_ sessions: [NextSessionsResponse]){
        if sessions.count > 1{
            GlobalValues.shared.userMentoring = sessions.first?.user
        }
        WebServices.shared().hideLoading{
            self.performSegue(withIdentifier: "homeSegue", sender: nil)
        }
    }
}
