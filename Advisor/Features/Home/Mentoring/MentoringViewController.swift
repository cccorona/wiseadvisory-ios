//
//  MentoringViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class MentoringViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    let identifyCell = "MentoringTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        tableView?.delegate = self
        tableView?.dataSource = self
        let nib = UINib(nibName: "MentoringTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: identifyCell)
    }
}

extension MentoringViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifyCell)! as! MentoringTableViewCell
        cell.setupUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "mentoringDetail", sender: nil)
    }
}
