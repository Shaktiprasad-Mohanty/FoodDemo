//
//  FoodOBJ.swift
//  Foodies
//
//  Created by Andola on 06/10/20.
//  Copyright © 2020 MonsterMind. All rights reserved.
//

import Foundation
class FoodOBJ:NSObject {
    var  id : String! = ""
    var  name : String! = ""
    var  rating : Double! = 0.0
    var  desc : String! = ""
    var  price : Double! = 0.0
    var isVegan : Bool! = true
    var imageName : String! = ""
    override init() {
        super.init()
    }
    
    /**
        This initialise method genarate FoodOBJ instance from dictionary .
        - Parameter dict: The dictonary with id , name, rating, description, price, isVegan, imageName keys
    */
    init(dict:[String: Any]) {
        id = dict["id"] as? String
        name = dict["name"] as? String
        rating = dict["rating"] as? Double
        desc = dict["description"] as? String
        price = dict["price"] as? Double
        isVegan = dict["isVegan"] as? Bool
        imageName = dict["imageName"] as? String
        
    }
}
