//
//  TabNavigationMenu.swift
//  Advisor
//
//  Created by Luis Fernando Bustos Ramírez on 24/09/20.
//  Copyright © 2020 com.wise.advisor. All rights reserved.
//

import UIKit

class TabNavigationMenu: UIView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        self.layer.backgroundColor = #colorLiteral(red: 0.2856232524, green: 0.2964096069, blue: 0.3793392181, alpha: 1).cgColor
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            let itemView = self.createTabItem(item: menuItems[i], style: (i == 0 ? .circle : .normal))
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.tag = i
            self.addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    enum TabItemStyle{
        case normal
        case circle
        case detail
    }
    
    // Create a custom nav menu item
    func createTabItem(item: TabItem, style: TabItemStyle) -> UIView {
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        tabBarItem.layer.backgroundColor = #colorLiteral(red: 0.2856232524, green: 0.2964096069, blue: 0.3793392181, alpha: 1).cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
        
        switch style {
        case .normal:
            NSLayoutConstraint.activate([
                itemIconView.heightAnchor.constraint(equalToConstant: 25), // Fixed height for our tab item(25pts)
                itemIconView.widthAnchor.constraint(equalToConstant: 25), // Fixed width for our tab item icon
                itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
                itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 18), // Position menu item icon 8pts from the top of it's parent view
                itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 30)
            ])
        case .circle:
            NSLayoutConstraint.activate([
                itemIconView.heightAnchor.constraint(equalToConstant: 40), // Fixed height for our tab item(25pts)
                itemIconView.widthAnchor.constraint(equalToConstant: 40), // Fixed width for our tab item icon
                itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
                itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 10), // Position menu item icon 8pts from the top of it's parent view
                itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 20)
            ])
            itemIconView.layer.cornerRadius = 20
            itemIconView.layer.masksToBounds = true
            itemIconView.layer.layoutIfNeeded()
            itemIconView.contentMode = .scaleAspectFill
        case .detail:
            tabBarItem.addSubview(itemTitleLabel)
            NSLayoutConstraint.activate([
                itemIconView.heightAnchor.constraint(equalToConstant: 30), // Fixed height for our tab item(25pts)
                itemIconView.widthAnchor.constraint(equalToConstant: 30), // Fixed width for our tab item icon
                itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
                itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 16), // Position menu item icon 8pts from the top of it's parent view
                itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 30),
                //            itemIconView.bottomAnchor.constraint(equalTo: tabBarItem.bottomAnchor, constant: 8)
                itemTitleLabel.heightAnchor.constraint(equalToConstant: 13), // Fixed height for title label
                itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
                itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4), // Position title label 4pts below item icon
            ])
        }
        
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        let borderWidth = tabToActivate.frame.size.width - 20
        let borderLayer = CALayer()
        borderLayer.backgroundColor = #colorLiteral(red: 0, green: 0.6705371141, blue: 0.9120171666, alpha: 1).cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 4)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
