//
//  DataParser.swift
//  Foodies
//
//  Created by Andola on 06/10/20.
//  Copyright © 2020 MonsterMind. All rights reserved.
//

import Foundation

private let foods : [String:[[String:Any]]] = ["Pizza":[
    
    [
        "id" : "",
        "name" : "Pizza Marinara",
        "rating" : 2.7,
        "description" : "Features tomatoes, garlic, oregano, and extra virgin olive oil.",
        "price" : 234.00,
        "isVegan" : true,
        "imageName" : "Marinara",
    ],
[
       "id" : "21213",
        "name" : "Sicilian Pizza Traditional Toppings",
        "rating" : 4,
        "description" : "Sicilian pizzas are often topped with bits of tomato, onion, anchovies, and herbs.",
        "price" : 321.00,
        "isVegan" : true,
        "imageName" : "Sicilian Pizza Traditional Toppings",
    ],
],
"burgers":[
    
    [
        "id" : "21214",
        "name" : "Chilli burger With Pepper Relish",
        "rating" : 4.3,
        "description" : "This scrumptious burger sits under a chilli lamb pattie, roasted bell pepper dip, onions, tomatoes and lettuce.",
        "price" : 235.00,
        "isVegan" : false,
        "imageName" : "Chilli burger With Pepper Relish",
    ],
[
       "id" : "21216",
        "name" : "Lamb and Tomato Stuffed Burger",
        "rating" : 3.9,
        "description" : "A perfectly shaped lamb pattie cooked to perfection. The tomatoes aren't just a topping but the spotlight of this beautiful dish.",
        "price" : 112.00,
        "isVegan" : true,
        "imageName" : "Lamb and Tomato Stuffed Burger",
    ],
[
       "id" : "21215",
        "name" : "Crunchy Chicken and Fish Burger",
        "rating" : 3.9,
        "description" : "If a burger for you is all about the meat and protein then you're at the right place. Experience the goodness of chicken, fish and a tangy hot and sour sauce.",
        "price" : 112.00,
        "isVegan" : false,
        "imageName" : "Crunchy Chicken and Fish Burger",
    ],
],
"beverages":[
    
    [
        "id" : "21217",
        "name" : "Sujeonggwa",
        "rating" : 4.7,
        "description" : "fresh ginger (giving around 1/4 cup/ 27g thin strips once peeled), Cinnamon sticks, water, sugar, Dried persimmon (if available, Pine nuts (to serve)",
        "price" : 107.00,
        "isVegan" : true,
        "imageName" : "Sujeonggwa",
    ],
[
       "id" : "21218",
        "name" : "Cucumber, Kale And Spinach Juice",
        "rating" : 3.7,
        "description" : "A fantastic recipe to boost your immune system, bursting with vitamins A, K, C, magnesium, calcium, copper, potassium. Infuse it with dash of ginger and lime for a taste that can surprises you.",
        "price" : 102.00,
        "isVegan" : true,
        "imageName" : "Cucumber, Kale And Spinach Juice",
    ],
],
"snacks":[
    
    [
        "id" : "21219",
        "name" : "Banana chips",
        "rating" : 4.2,
        "description" : "Deep-fried and/or dried slices of bananas (fruits of herbaceous plants of the genus Musa of the soft, sweet \"dessert banana\" variety), they can be covered with sugar or honey and have a sweet taste, or they can be fried in oil and spices and have a salty and/or spicy taste.",
        "price" : 100.00,
        "isVegan" : true,
        "imageName" : "Banana_chips",
    ],
[
       "id" : "21220",
        "name" : "Ghever",
        "rating" : 4.7,
        "description" : "A Rajasthani sweet traditionally associated with the Teej Festival, it is disc-shaped, and made from ghee, flour, and sugar syrup. The many varieties of ghevar include plain, mawa, and malai ghevar.",
        "price" : "",
        "isVegan" : true,
        "imageName" : "Ghevar",
    ],
]]

class DataParser {
    
    /**
        This  method is to parse JSON data to FoodOBJ.
        - Returns: The dictonary with foodtype as key and foods as value
    */
    func parseFood()->[String:[FoodOBJ]]{
        var result = [String:[FoodOBJ]]()
        for dict in foods {
            var arrFoods = [FoodOBJ]()
            for food in dict.value {
                arrFoods.append(FoodOBJ(dict: food))
            }
            result[dict.key] = arrFoods
        }
        return result
    }
}
