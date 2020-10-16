//
//  UI.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

extension UIView {
    func makeWiseBorder(){
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.9287306666, green: 0.948861897, blue: 0.965452373, alpha: 1)
        self.layer.layoutIfNeeded()
    }
    
    func makeCircle(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.width/2
        self.layer.layoutIfNeeded()
    }
    
    func makeCornerRadius(){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.layer.layoutIfNeeded()
    }
}
