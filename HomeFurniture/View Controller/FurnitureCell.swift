//
//  FurnitureCell.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/21/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class FurnitureCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView : UIImageView!
    @IBOutlet weak var itemName : UILabel!
    @IBOutlet weak var itemDescription : UILabel!
    @IBOutlet weak var circleView : UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateView(with funiture: Furniture) {
        
        circleView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = 12
    
        if let image = funiture.image {
            itemImageView.image = image
        }
        else{
             itemImageView.image = UIImage(named: "ItemImage.png")
        }
        
        if let name = funiture.name {
            itemName.text = name
        }
        
        if let description = funiture.description {
            itemDescription.text = description
        }
    }
    
}
