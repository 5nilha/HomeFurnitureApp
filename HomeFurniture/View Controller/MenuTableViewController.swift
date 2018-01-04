//
//  MenuTableViewController.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/29/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    struct Properties {
        static var dashboardSegue = "dashboardSegue"
        static var furnitureSegue = "furnitureSegue"
        static var helpSegue = "helpSegue"
        static var dashboardVCIdentifier = "dashboardVC"
        static var furnitureVCIdentifier = "furnitureVC"
        static var helpVCIdentifier = "helpVC"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

}
