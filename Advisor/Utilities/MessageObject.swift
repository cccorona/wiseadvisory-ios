//
//  MessageObject.swift
//  CollegeOne
//
//  Created by Cesar Corona Cabrera on 01/10/18.
//  Copyright © 2018 CollegeOne. All rights reserved.
//

import Foundation
import UIKit



final class MessageObject: NSObject {
    static let sharedInstance = MessageObject()
    
    private override init() {super.init()}
    
    func showMessage(_ message:String, title:String, accept:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: accept, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        if accept.count > 0{
            alertController.addAction(okAction)
        }
        if #available(iOS 13.0, *) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alertController, animated: true, completion:nil)
            }
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = UIViewController.init()
            window.windowLevel = UIWindow.Level.alert+1
            window.makeKeyAndVisible()
            window.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showMessage(_ message:String, title:String, action:UIAlertAction){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(action)
        if #available(iOS 13.0, *) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alertController, animated: true, completion:nil)
            }
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = UIViewController.init()
            window.windowLevel = UIWindow.Level.alert+1
            window.makeKeyAndVisible()
            window.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showMessage(_ message:String, title:String, okAction:UIAlertAction, cancelAction:UIAlertAction){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        if #available(iOS 13.0, *) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alertController, animated: true, completion:nil)
            }
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = UIViewController.init()
            window.windowLevel = UIWindow.Level.alert+1
            window.makeKeyAndVisible()
            window.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showMessage(_ message:String, title:String, okAction:UIAlertAction, cancelMessage:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(okAction)
        let cancelAction = UIAlertAction(title: cancelMessage, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(cancelAction)
        if #available(iOS 13.0, *) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController  {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alertController, animated: true, completion:nil)
            }
        } else {
            let window = UIWindow.init(frame: UIScreen.main.bounds)
            window.rootViewController = UIViewController.init()
            window.windowLevel = UIWindow.Level.alert+1
            window.makeKeyAndVisible()
            window.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
