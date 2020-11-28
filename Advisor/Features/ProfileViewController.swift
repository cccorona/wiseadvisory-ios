//
//  ProfileViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SideMenu
import Kingfisher

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
        
        if let picture = GlobalValues.shared.user?.picture , let url = URL.init(string: "https:"+picture) {
            profileImage?.kf.setImage(with: url, placeholder: UIImage(named: "guy") )
        }
        return settings
    }
    
    
    private func setupUI(){
        profileImage?.makeCircle()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmisKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - NavigationMenuBaseController.tabBarHeight
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
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
