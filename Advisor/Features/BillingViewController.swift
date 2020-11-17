//
//  BillingViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class BillingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        //let tap = UITapGestureRecognizer(target: self.view, action: #selector(dissmisKeyboard))
        //tap.cancelsTouchesInView = false
        //view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }

}
