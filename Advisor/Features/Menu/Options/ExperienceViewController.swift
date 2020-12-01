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
    
    let results: [String] = ["Google", "Facebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        backButton?.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        //listExperiences.register(GeneralTableViewCell.self, forCellReuseIdentifier: "GeneralTableViewCell")
        listExperiences.register(UINib(nibName: "GeneralTableViewCell", bundle: nil), forCellReuseIdentifier: "GeneralTableViewCell")
        listExperiences.dataSource = self
        listExperiences.delegate = self
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    

    @objc func goBack(){
        self.navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
}

extension ExperienceViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralTableViewCell") as! GeneralTableViewCell
        cell.title?.text = results[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
