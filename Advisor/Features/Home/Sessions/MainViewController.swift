//
//  MainViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {
    
    @IBOutlet private weak var sessionsTableView: UITableView?
    let identifyCell = "SessionRequestTableViewCell"
    var sessions: [NextSessionsResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        loadSessions()
    }
    
    private func setupUI(){
        let nib = UINib(nibName: "SessionRequestTableViewCell", bundle: nil)
        sessionsTableView?.register(nib, forCellReuseIdentifier: identifyCell)
        sessionsTableView?.dataSource = self
        sessionsTableView?.delegate = self
    }
    
    func loadSessions(){
        WebServices.shared().getNextSessions(
            user_id: GlobalValues.shared.user_id) { (result) in
            switch result{
            case .success(let sessions):
                self.handleSuccess(sessions)
            case .failure(let error):
                MessageObject.sharedInstance.showMessage(error.localizedDescription, title: "Error", accept: "Aceptar")
            }
        }
    }
    
    func handleSuccess(_ sessions: [NextSessionsResponse]){
        self.sessions = sessions
        sessionsTableView?.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifyCell)! as! SessionRequestTableViewCell
        cell.setupUI(with: sessions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "seeSession", sender: nil)
    }
}
