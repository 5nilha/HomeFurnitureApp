//
//  FurnitureTableViewController.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/21/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class FurnitureTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        Rooms.filteredArray = Rooms.roomsList
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = 80.0

        setupNavBar()
        addSideBarMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false

    }
    

    
    // MARK: ----------------------- SearchBar Delegate Methods -----------------------

//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        Rooms.filteredArray = []
//        if let search = searchBar.text {
//            print("Search: \(search)")
//
//            if !search.isEmpty {
//                filterRooms(filterBy: "room", search: search)
//                self.tableView.reloadData()
//            }
//            else {
//                Rooms.filteredArray = Rooms.roomsList
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Rooms.filteredArray = []
        if let search = searchBar.text {
            print("Search: \(search)")
            
            if !search.isEmpty {
                filterRooms(filterBy: "room", search: search)
                self.tableView.reloadData()
            }
            else {
                Rooms.filteredArray = Rooms.roomsList
                self.tableView.reloadData()
            }
        }
    }
    
    //--------------------- ending of search bar delegate methods--------------------
    
    //--------------------Filter the array -----------------------------------------
    func filterRooms(filterBy: String, search: String) {
       
        switch filterBy {
        case "room":
            Rooms.filteredArray = Rooms.roomsList.filter({ (room) -> Bool in
                print (room.name)
                return room.name.contains(search)
            })
            for room in Rooms.filteredArray {
                print("inside Array")
                print(room.name)
            }
            
        default:
            print("No filter applied")
        }
    }

    // MARK: -------- Table view data source-------------------

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return Rooms.filteredArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

         return Rooms.filteredArray[section].name
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 25))
        returnedView.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
       
        let sectionTitle = UILabel(frame: CGRect(x: 0, y: 2, width: view.frame.size.width, height: 25))
        sectionTitle.text = Rooms.filteredArray[section].name
        sectionTitle.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        sectionTitle.textAlignment = .center
        returnedView.addSubview(sectionTitle)
        
        return returnedView
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Rooms.filteredArray[section].furniture.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "furnitureCell", for: indexPath) as! FurnitureCell
        
        
        print("\(Rooms.filteredArray[indexPath.section].name) : index \(Rooms.filteredArray[indexPath.section].furniture[indexPath.row]) ")
        let funitureItem = Rooms.filteredArray[indexPath.section].furniture[indexPath.row]
        
        cell.updateView(with: funitureItem)
        
//        cell.updateView(with: Rooms.roomsList[indexPath.section].furniture[indexPath.row])
       
        return cell
    }
    
    
    //------------------ Select a cell---------------------------
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editFurniture", sender: self)
    }
 
    
    // MARK: ------------------ Actions ---------------------------------------
    
    // ------------------- prepare to segue to edit a cell item ----------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editFurniture" {
            
            if let destinationVC = segue.destination as? EditFurnitureTableViewController {
                if let selectedSection = tableView.indexPathForSelectedRow?.section , let indexPath = tableView.indexPathForSelectedRow?.row {
                    
                    destinationVC.roomType = Rooms.roomsList[selectedSection].name
                    
                    destinationVC.furnitureItem = Rooms.roomsList[selectedSection].furniture[indexPath]
                }
            }
        }
    }
    
    //-----------------Add Button Tapped ------------------------------------

    @IBAction func addButtonTapped() {
        performSegue(withIdentifier: "addFurniture", sender: self)
    }
    
    
   //------------------ dismiss from EditFurnitureTableViewController
    @IBAction func unwindToFurnitureTableVC(segue : UIStoryboardSegue) {
        if let sourceVC = segue.source as? EditFurnitureTableViewController {
            
            if let furniture = sourceVC.furnitureItem, let room = sourceVC.roomType {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let indexSection = indexPath.section
                    let indexRow = indexPath.row
                    
                    Rooms.roomsList[indexSection].furniture.remove(at: indexRow)
                    Rooms.addNewItem(name: room, item: furniture.name! , description: furniture.description!, image: furniture.image)
                }
                else {
                    Rooms.addNewItem(name: room, item: furniture.name! , description: furniture.description!, image: furniture.image)
                }
            }
        }
    }

}
