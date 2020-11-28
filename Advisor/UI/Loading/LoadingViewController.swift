//
//  LoadingViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 27/11/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet var loadingView : UIImageView!
    
    override func viewDidLoad() {
        print("Start loading")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadingView.startRotating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.loadingView.stopRotating()
    }
}

extension UIView {
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(Double.pi * 2.0)
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }
    
    func stopRotating() {
        let kAnimationKey = "rotation"
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
}
