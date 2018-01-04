//
//  DashboardTableViewController.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/29/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Rooms.loadModels()
        addSideBarMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
