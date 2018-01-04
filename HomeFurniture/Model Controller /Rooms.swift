//
//  Rooms.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/21/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import Foundation
import UIKit

class Rooms {
    
    static var roomsList : [Room] = []
    static var filteredArray : [Room] = []
    
    static func addNewItem(name : String, item: String, description: String, image: UIImage?) {
        
        var i = 0
        for room in roomsList {
            if room.name == name{
                roomsList[i].addNewFunitureItem(item: item, description: description, image: image)
                
                return
            }
            i += 1
        }
        
        roomsList.append(Room(name: name , furniture: [Furniture(name: item, image: image, description: description)]))
    }
    
    
    static func loadModels() {

        let item1 = Room(name: "LIVING ROOM")
        item1.addNewFunitureItem(item: "Couch", description: "Brown Leather Couch", image: nil)
        roomsList.append(item1)
        
        let item2 = Room(name: "DINING ROOM")
        item2.addNewFunitureItem(item: "Table", description: "6 chair rectangle table ", image: nil)
        roomsList.append(item2)
        
        Rooms.addNewItem(name: "LIVING ROOM", item: "Television", description: "LG LCD Tv 55' ", image: nil)
        Rooms.addNewItem(name: "DINING ROOM", item: "Oven", description: "Electric Oven", image: nil)
        
        Rooms.addNewItem(name: "MASTER BEDROOM", item: "King Bed", description: "California King size bed", image: nil)
        
    }
    
    
}
