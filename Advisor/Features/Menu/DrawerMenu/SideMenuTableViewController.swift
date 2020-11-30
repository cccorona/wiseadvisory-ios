//
//  SideMenuTableViewController.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 23/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import SideMenu
import Kingfisher

class SideMenuTableViewController: UITableViewController {
    
    var options: [String] = [
        "Mis clientes", "Mis calificaciónes", "Mis experiencias",
        "Mis Cursos", "Mis Idiomas", "Contáctanos",
        "Terminos y condiciones" , "Aviso de privacidad"
    ]
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        
        // Set up a cool background image for demo purposes
        
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "guy"))
//        imageView.contentMode = .scaleAspectFit
//        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//        if let picture = GlobalValues.shared.user?.picture , let url = URL.init(string: "https:"+picture) {
//            imageView.kf.setImage(with: url)
//        }
//        tableView.backgroundView = imageView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        var vc: UIViewController?
        switch indexPath.row{
        case 1:
            vc = ClientsViewController()
        case 2:
            vc = CalificationViewController()
        case 3:
            vc = ExperienceViewController()
        case 4:
            vc = CoursesViewController()
        case 5:
            vc = LanguajeViewController()
        case 6:
            vc = ContactViewController()
        case 7:
            vc = TermsAndConditionsViewController()
        case 8:
            vc = PrivacyViewController()
        case 9:
            NotificationCenter.default.post(name: .Logout, object: self, userInfo: nil)
        default:
            return
        }
        if let viewController = vc {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
