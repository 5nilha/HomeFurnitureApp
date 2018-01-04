//
//  Room.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/21/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import Foundation
import UIKit

class Room {
 
    var name: String
    var furniture: [Furniture] = []
    
    init(name: String) {
        self.name = name
    }
    
    init (name: String, furniture: [Furniture]) {
        self.name = name
        self.furniture = furniture
    }
    
    func addNewFunitureItem(item : String, description : String, image : UIImage? ){
        furniture.append(Furniture(name: item, image: image, description: description))
    }
    
}
