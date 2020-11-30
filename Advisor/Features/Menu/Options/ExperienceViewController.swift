//
//  ExperienceViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 29/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ExperienceViewController: UIViewController {
    @IBOutlet var backButton: UIButton?
    
    @IBOutlet weak var companyNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var yearsTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var cityTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var positionTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var responsabilitiesTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var countryTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var listExperiences: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton?.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        setupUI()
    }
    
    func setupUI(){
        backButton?.addTarget(self, action: #selector(goBack), for: .touchUpInside)
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
