//
//  DetailsViewController.swift
//  Foodies
//
//  Created by MM on 06/10/20.
//  Copyright © 2020 MonsterMind. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var imgVegMark: UIImageView!
    @IBOutlet weak var btnAddFoodToggle: UIButton!
    
    //MARK: Public properties
    var food : FoodOBJ!
    /// This closer is to send back the food id on add food togglebutton tap
    /// - Parameter _ : is String type wich contains the food id
    var onAddToggle : ((String)->Void)?
    var isSelected : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
    }
    
    //MARK: Userdefiened methods
    ///This method is to load data and update UI
    func loadData() {
        lblRating.text = "\(food.rating ?? 0.0) / 5"
        lblPrice.text = "₹ \(food.price ?? 0.00)"
        lblFoodName.text = food.name
        lblDescription.text = food.desc
        imgFood.image = UIImage(named: food.imageName)
        imgVegMark.image = UIImage(named: food.isVegan ? "veg" : "meet")
        btnAddFoodToggle.isSelected = !isSelected
    }
    
    // MARK: - Button action
    @IBAction func foodAddButton(_ sender: UIButton) {
        onAddToggle?(food.id)
        self.navigationController?.popViewController(animated: true)
    }

}
