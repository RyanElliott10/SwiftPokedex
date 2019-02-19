//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ryan Elliott on 2/18/19.
//  Copyright © 2019 Ryan Elliott. All rights reserved.
//

import UIKit

class Pokemon {
    
    // Optional since we're fetching data from an API and we're not guaranteed anything
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseXP: Int?
    
    init(id: Int, dictionary: [String: AnyObject]) {
        self.id = id
        
        // Checks if it's in the dictionary. If not, asigns nil
        self.name = dictionary["name"] as? String
        self.imageUrl = dictionary["imageUrl"] as? String
        self.weight = dictionary["weight"] as? Int
        self.height = dictionary["height"] as? Int
        self.defense = dictionary["defense"] as? Int
        self.attack = dictionary["attack"] as? Int
        self.description = dictionary["description"] as? String
        self.type = dictionary["type"] as? String
    }
    
}
