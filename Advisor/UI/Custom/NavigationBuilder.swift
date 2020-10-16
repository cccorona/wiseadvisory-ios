//
//  NavigationBuilder.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import SideMenu

class NavigationBuilder: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

class SlideMenuNavigationBuilder: SideMenuNavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension UINavigationController {
    func setupUI(){
        let textStyleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
         //   .font: SPStyle.Fonts.title3
        ]
        self.navigationBar.barTintColor = #colorLiteral(red: 0.2856232524, green: 0.2964096069, blue: 0.3793392181, alpha: 1)
        self.navigationBar.titleTextAttributes = textStyleAttributes
        if #available(iOS 11.0, *) {
            //self.navigationController?.navigationBar.largeTitleTextAttributes = largeTextTitleAttributes
            self.navigationBar.prefersLargeTitles = false
        }
        self.navigationBar.tintColor = .white
        self.navigationBar.barStyle = .black
    }
}
