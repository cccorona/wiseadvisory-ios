//
//  ProfileViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SideMenu

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImage: UIImageView?
    @IBOutlet private weak var profileName: UILabel?
    @IBOutlet private weak var profileDirection: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
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
        profileImage?.makeCircle()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
}

extension ProfileViewController: SideMenuNavigationControllerDelegate {
    
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
