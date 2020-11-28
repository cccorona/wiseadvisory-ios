//
//  TabItem .swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 24/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit
import Kingfisher

enum TabItem: String, CaseIterable {
    case main
    case profile
    case finance
    case mentoring
    case billing
    
    var viewController: UIViewController {
        switch self {
        case .main:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "NavigatorMainViewController")
        case .profile:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "NavigatorProfileViewController")
        case .finance:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "NavigatorFinancieViewController")
        case .mentoring:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "NavigatorMentoringViewController")
        case .billing:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: "NavigatorBillingViewController")
        }
    }
    
    var icon: UIImage {
        switch self {
        case .profile:
            return #imageLiteral(resourceName: "guy")
        case .main:
            return #imageLiteral(resourceName: "baseline_file_copy_black_24pt")
        case .finance:
            return #imageLiteral(resourceName: "baseline_sentiment_satisfied_alt_black_24pt")
        case .mentoring:
            return #imageLiteral(resourceName: "baseline_chat_black_24pt")
        case .billing:
            return #imageLiteral(resourceName: "baseline_flash_on_black_24pt")
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
