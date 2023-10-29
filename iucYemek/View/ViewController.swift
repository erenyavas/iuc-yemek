//
//  ViewController.swift
//  iucYemek
//
//  Created by Eren Yavaş on 29.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var mealsTableView: UITableView!
    var mealViewModel = MealViewModel()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealsTableView.dataSource = self
        mealsTableView.rowHeight = 200
        
        // Fetch data
        mealViewModel.fetchMeals() { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.mealsTableView.reloadData()
                case .failure(let error):
                   // Handle the error, e.g., display an error message
                   print("Error: \(error)")
               }
           }
       }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealViewModel.numberOfMeals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealsTableViewCell
        let meal = mealViewModel.meal(at: indexPath.row)
        
        cell.dateLabel.text = meal.day
        cell.mainMealLabel.text = meal.meals.anaYemek
        cell.sideMealLabel.text = meal.meals.yanYemek
        cell.soupMealLabel.text = meal.meals.corba
        cell.aperetiveLabel.text = meal.meals.aperatif
        cell.calorieLabel.text = meal.meals.kalori
        
        return cell
    }
    
    
    
    
}

