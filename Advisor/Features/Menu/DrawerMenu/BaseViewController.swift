//
//  BaseViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 29/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SideMenu

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
        setupNotification()
    }
    
    private func setupNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(closeSession), name: .Logout, object: nil)
    }
    
    @objc func closeSession(){
        WebServices.shared().logoutUser(
            user_id: GlobalValues.shared.user_id
        ) { (result) in
            print(result)
            self.handleCloseSession()
        }
    }
    
    func handleCloseSession(){
        Credential.shared.logOut()
        let vc = (storyboard?.instantiateViewController(withIdentifier: "StartID"))!
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    open func showMenu(){
        present(SideMenuManager.default.rightMenuNavigationController!, animated: true, completion: nil)
    }
    
    open func hideMenu(){
        dismiss(animated: true, completion: nil)
    }
    
    private func setupSideMenu() {
        SideMenuManager.default.rightMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.rightMenuNavigationController?.settings = makeSettings()
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: view)
    }
    
    private func makeSettings() -> SideMenuSettings {
        var settings = SideMenuSettings()
        settings.presentationStyle = .viewSlideOut
        settings.menuWidth = min(view.frame.width, view.frame.height) * 0.7
        settings.blurEffectStyle = .dark
        settings.statusBarEndAlpha = 1
        return settings
    }
}

extension BaseViewController: SideMenuNavigationControllerDelegate {
    
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
