//
//  MainViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {
    
    @IBOutlet private weak var sessionsTableView: UITableView?
    let identifyCell = "SessionRequestTableViewCell"
    var sessions: [NextSessionsResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        loadSessions()
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
    
    private func setupSideMenu() {
        SideMenuManager.default.rightMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.rightMenuNavigationController?.settings = makeSettings()
        SideMenuManager.default.leftMenuNavigationController = nil
        //SideMenuManager.default.addPanGestureToPresent(toView: navigationController!.navigationBar)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    private func makeSettings() -> SideMenuSettings {
        //            presentationStyle.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        //            presentationStyle.menuStartAlpha = CGFloat(menuAlphaSlider.value)
        //            presentationStyle.menuScaleFactor = CGFloat(menuScaleFactorSlider.value)
        //            presentationStyle.onTopShadowOpacity = shadowOpacitySlider.value
        //            presentationStyle.presentingEndAlpha = CGFloat(presentingAlphaSlider.value)
        //            presentationStyle.presentingScaleFactor = CGFloat(presentingScaleFactorSlider.value)
        
        var settings = SideMenuSettings()
        settings.presentationStyle = .viewSlideOut
        settings.menuWidth = min(view.frame.width, view.frame.height) * 0.7
        settings.blurEffectStyle = .dark
        settings.statusBarEndAlpha = 1
        
        return settings
    }
    
    private func setupUI(){
        sessionsTableView?.dataSource = self
        sessionsTableView?.delegate = self
        let nib = UINib(nibName: "SessionRequestTableViewCell", bundle: nil)
        sessionsTableView?.register(nib, forCellReuseIdentifier: identifyCell)
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
}

extension MainViewController: SideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}
