//
//  EditFurnitureTableViewController.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/22/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class EditFurnitureTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    struct propertyKeys {
        static let saveUnwind = "saveUnwind"
        static let cancelUnwind = "cancelUnwind"
    }
    
    var furnitureItem : Furniture?
    var roomType : String!
    
    var rooms = ["LIVING ROOM", "DINING ROOM", "BEDROOM", "MASTER BEDROOM", "KITCHEN", "BATHROOM"]
    var sectionItems = ["PICTURE", "ROOM TYPE", "ITEM NAME", "QUANTITY / PRICE", "SHORT ITEM NOTE","DIMENSIONS", "ITEM INFO", "PURCHASE DATE", "WARRANTY", "TOTAL"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        tableView.sectionHeaderHeight = 30
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //-----------Update the view ----------------------
    func updateView() {
        
        if let image = furnitureItem?.image {
            imageView.image = image
        }
        
        if let name = furnitureItem?.name {
            itemNameTextField.text = name
            navigationItem.title = name
        }
        
        if let description = furnitureItem?.description{
            descriptionTextView.text = description
        }
        
        if let room = roomType {
            let index = rooms.index(of: room)
            pickerView.selectRow(index!, inComponent: 0, animated: true)
        }
    }
    
    
    //---------------- Table View Methods -------------------------------
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        returnedView.backgroundColor = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)
        
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 2, width: view.frame.size.width, height: 30))
        headerLabel.text = sectionItems[section]
        headerLabel.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        headerLabel.textAlignment = .center
        
        returnedView.addSubview(headerLabel)
        
        return returnedView
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 5 {
//                performSegue(withIdentifier: "chooseDateSegue", sender: self)
//        }
        
        print("Index number \(indexPath.row)")
    }
    
//  --------------Image Picker Methods ----------------------------
    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Choose a Image Source", message: nil, preferredStyle: .actionSheet)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
                imagePicker.sourceType = .camera
               
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            imageView.image = selectedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    //----------------- Picker View Methods -------------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rooms.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rooms[row]
    }
    
    
    //-----------------Prepare to passe data back -------------------
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
       
        var itemName = itemNameTextField.text ?? ""
        if itemName == "" {
            itemName = "Item"
        }
        let itemImage = imageView.image ?? nil
        let itemDescription = descriptionTextView.text ?? ""

        furnitureItem = Furniture(name: itemName, image: itemImage, description: itemDescription)

        let roomIndex = pickerView.selectedRow(inComponent: 0)
        roomType = rooms[roomIndex]
        
        performSegue(withIdentifier: propertyKeys.saveUnwind, sender: self)
    }
    
    
    //---------------Cancel Button-----------------
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {

    }
    
}
