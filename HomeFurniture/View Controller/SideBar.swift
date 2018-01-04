//
//  SideBar.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/29/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import Foundation
import UIKit

struct SideBar {
    
    
    func sideMenus() {
        
        if revealViewController() != nil {
            
            let menuBtn = UIBarButtonItem(image: UIImage(named: "Menu") , style: .plain, target: self, action: nil)
            menuBtn.tintColor = UIColor.white
            self.navigationItem.rightBarButtonItem = menuBtn
            
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            
            //            menuButton.target = revealViewController()
            //            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            //            alertButton.target = revealViewController()
            //            alertButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}
