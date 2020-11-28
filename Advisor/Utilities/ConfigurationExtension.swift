//
//  ConfigurationExtension.swift
//  CollegeOne
//
//  Created by Cesar Corona Cabrera on 11/10/18.
//  Copyright © 2018 CollegeOne. All rights reserved.
//

import Foundation
import UIKit



let pinkAppColor = UIColor(red: 0.815686274509804, green: 0.12156862745098, blue: 0.329411764705882, alpha: 1.0)
//UIColor(red:218/255, green: 43/255, blue: 107/255, alpha: 1.0)
let darkAppColor = UIColor(red: 53/255, green: 53/255, blue: 53/255, alpha: 1.0)
let sBlueColor = UIColor(red: 0/255, green: 144/255, blue: 166/255, alpha: 1.0)
let orange = UIColor(red: 243/255, green: 103/255, blue: 8/255, alpha: 1.0)
let primaryColor = UIColor(named: "primaryColor")

let lessOrange = UIColor(red: 249/255, green: 157/255, blue: 40/255, alpha: 1.0)

var colorForPickerWhenFocused = pinkAppColor;

extension UIViewController{
    
    func setConfiguration(){
        if self is LoginViewController{
            self.dismissKeyboarTapping(view: self.view)
        }
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        setupNavigationController()
        setupTabBar()
    }
    
    func setImageBlackConfiguration(){
        if self is LoginViewController{
            self.dismissKeyboarTapping(view: self.view)
        }
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "splash_min")!.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .tile), for: .default)
    }
    
    func setupNavigationController(){
        navigationController?.navigationBar.barTintColor = UIColor(named: "primaryColor")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "app_logo_white_lq")
        navigationItem.titleView = imageView
    }
    
    func setupTabBar(){
        tabBarController?.tabBar.barTintColor = primaryColor
        tabBarController?.tabBar.tintColor = UIColor(named: "tabBarEnable")
    }
    
    func setNavBarForMain(title:String){
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.title = title
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        setupTabBar()
        setRightLogo()
    }
    
    func setRightLogo(){
        let viewFN = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageStudentView = UIImageView(frame: viewFN.frame)
        imageStudentView.image = UIImage(named: "app_logo_white_lq")
        imageStudentView.contentMode = .scaleAspectFit
        viewFN.addSubview(imageStudentView)
        viewFN.backgroundColor = UIColor.clear
        let rightBarButton = UIBarButtonItem(customView: viewFN)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    //MARK: Some usefully features
    func dismissKeyboarTapping(view:UIView){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dissmissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dissmissKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc func takeScreenShot() -> UIImage{
        let imageSize = UIScreen.main.bounds.size as CGSize;
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        let context = UIGraphicsGetCurrentContext()
        for obj : AnyObject in UIApplication.shared.windows {
            if let window = obj as? UIWindow {
                if window.responds(to: #selector(getter: UIWindow.screen)) || window.screen == UIScreen.main {
                    // so we must first apply the layer's geometry to the graphics context
                    context!.saveGState();
                    // Center the context around the window's anchor point
                    context!.translateBy(x: window.center.x, y: window.center
                        .y);
                    // Apply the window's transform about the anchor point
                    context!.concatenate(window.transform);
                    // Offset by the portion of the bounds left of and above the anchor point
                    context!.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x,
                                         y: -window.bounds.size.height * window.layer.anchorPoint.y);
                    
                    // Render the layer hierarchy to the current context
                    window.layer.render(in: context!)
                    
                    // Restore the context
                    context!.restoreGState();
                }
            }
        }
        let image = UIGraphicsGetImageFromCurrentImageContext();
        return image!
    }
}
