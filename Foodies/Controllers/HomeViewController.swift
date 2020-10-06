//
//  HomeViewController.swift
//  Foodies
//
//  Created by Andola on 06/10/20.
//  Copyright © 2020 MonsterMind. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet var bannerView: UIView!
    @IBOutlet weak var foodTableView: UITableView!
    
    fileprivate var foodDict = [String:[FoodOBJ]]()
    fileprivate var originalFoodDict = [String:[FoodOBJ]]()
    fileprivate var foodTypes = [String]()
    fileprivate var foodIdInBag = [String]()
    
    fileprivate var bannerImageNames = ["food","Ghevar","Lamb and Tomato Stuffed Burger","Marinara","Sicilian Pizza Traditional Toppings","Sujeonggwa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loadData()
    }
    
    //MARK: Userdefiened methods
    ///This method is to load data and update UI
    func loadData() {
        originalFoodDict = DataParser().parseFood()
        foodTypes = Array(originalFoodDict.keys)
        foodDict = originalFoodDict
        foodTableView.reloadData()
    }
}


// MARK: - TableView Delegate Methods -
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    ///Table view number of section
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodTypes.count + 1
    }
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 80.0
            }else{
                return 40.0
            }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            bannerCollectionView.reloadData()
            return bannerView
        }else{
            let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
            returnedView.backgroundColor = UIColor(red: 203.0/255.0, green: 203.0/255.0, blue: 203.0/255.0, alpha: 1)
            
            // set tag to recognise section in tap action
            returnedView.tag = section
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleSectionHeaderTap(_:)))
            returnedView.addGestureRecognizer(tap)
            
            
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 40))
            label.text = "  " + foodTypes[section - 1]
            label.textColor = UIColor.darkGray
            label.font = UIFont.systemFont(ofSize: 18)
            returnedView.addSubview(label)
            
            return returnedView
        }
        
    }
    
    ///Table view number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 0
        }else{
            return foodDict[foodTypes[section - 1]]!.count
        }
    }
    ///Table view cell for row at index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "FoodTableViewCell") as! FoodTableViewCell
        
        if indexPath.section == 0{
            
        }else{
            let food = foodDict[foodTypes[indexPath.section - 1]]![indexPath.row]
            cell.imgFood.image = UIImage(named: food.imageName)
            cell.blurView.isHidden = !foodIdInBag.contains(food.id)
            cell.lblFoodName.text = food.imageName
            cell.lblPrice.text = "₹ \(food.price ?? 0.00)"
        }
        return cell
    }
    ///Table view did select row at index
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVc = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let food = foodDict[foodTypes[indexPath.section - 1]]![indexPath.row]
        detailVc.food = food
        detailVc.onAddToggle = { id in
            if !self.foodIdInBag.contains(id) {
                self.foodIdInBag.append(id)
            } else {
                if let index = self.foodIdInBag.firstIndex(of: id) {
                    self.foodIdInBag.remove(at: index)
                }
            }
            self.foodTableView.reloadData()
            
        }
        detailVc.isSelected = !foodIdInBag.contains(food.id)
        self.navigationController?.pushViewController(detailVc, animated: true)
        
    }
    
    /**
        This method is for tap action on section header  to fold/unfold the items.
        - Parameter sender: The UITapGestureRecognizer from which we can get the view and get section from the tag value
    */
    @objc func handleSectionHeaderTap(_ sender: UITapGestureRecognizer? = nil) {
        let section = sender?.view?.tag ?? 1
        let value = foodDict[foodTypes[section - 1]]
        if value?.count == 0 {
            foodDict[foodTypes[section - 1]] = originalFoodDict[foodTypes[section - 1]]
        } else {
            foodDict[foodTypes[section - 1]] = [FoodOBJ]()
        }
        self.foodTableView.reloadData()
    }
    
}


// MARK: - CollectionView Delegate -
extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate{
    
    ///Collection vieq number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageNames.count
    }
    
    ///collection view cell for item at index
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        cell.imgBanner.image = UIImage(named: bannerImageNames[indexPath.row])
        return cell
    }
    
    
}
