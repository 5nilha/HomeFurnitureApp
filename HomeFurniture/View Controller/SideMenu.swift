//
//  SideMenu.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/31/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: -------------------------- Configure the SideBar Menu ----------------------------------
    func addSideBarMenu() {
        if revealViewController() != nil {
            
            let menuBtn = UIBarButtonItem(image: UIImage(named: "Menu") , style: .plain, target: self, action: nil)
            menuBtn.tintColor = UIColor.white
            self.navigationItem.leftBarButtonItem = menuBtn
            
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 250
            revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
}
