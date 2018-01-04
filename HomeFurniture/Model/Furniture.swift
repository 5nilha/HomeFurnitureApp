//
//  Furniture.swift
//  HomeFurniture
//
//  Created by Fabio Quintanilha on 12/21/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import Foundation
import UIKit

class Furniture {
    
    var name : String!
    var image : UIImage?
    var description : String!
    
    init(name : String, image : UIImage?, description : String) {
        self.name = name
        self.image = image
        self.description = description
    }
    
}
