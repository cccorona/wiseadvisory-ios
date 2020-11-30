//
//  CoursesViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 29/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {
    @IBOutlet var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton?.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        // Do any additional setup after loading the view.
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
