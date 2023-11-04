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
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            setUserInterfaceStyle(forWindowScene: windowScene, lightMode: true)
        }
        
        mealsTableView.dataSource = self
        mealsTableView.delegate = self
        mealsTableView.rowHeight = 430
        
        loadDataTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mealViewModel.updateAndAddRatings()
        mealsTableView.reloadData()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealViewModel.numberOfMeals()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealsTableViewCell
        cell.selectionStyle = .none
        let meal = mealViewModel.meal(at: indexPath.row)
        
        cell.dateLabel.text = meal.day
        cell.mainMealLabel.text = meal.meals.mainMeal
        cell.sideMealLabel.text = meal.meals.sideMeal
        cell.soupMealLabel.text = meal.meals.soup
        cell.aperetiveLabel.text = meal.meals.aperative
        cell.calorieLabel.text = meal.meals.calorie
        cell.dayNameLabel.text = mealViewModel.getDayNameForDate(dateString: meal.day)
        
        
        if let mainMealRating =  meal.meals.mainMealRating ?? Optional(0){
            cell.mainMealRating.rating = mainMealRating
        }
        if let sideMealRating =  meal.meals.sideMealRating ?? Optional(0){
            cell.sideMealRating.rating = sideMealRating
        }
        if let soupRating =  meal.meals.soupRating ?? Optional(0){
            cell.soupRating.rating = soupRating
        }
        if let aperetiveRating =  meal.meals.aperativeRating ?? Optional(0){
            cell.aperetiveRating.rating = aperetiveRating
//            if aperetiveRating == Optional(0){
//                cell.aperetiveRating.text = "Puanlanmadı."
//            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMealDetailVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMealDetailVC" {
            if let indexPath = mealsTableView.indexPathForSelectedRow {
                let selectedMeal = mealViewModel.meal(at: indexPath.row)
                if let destinationVC = segue.destination as? MealDetailsViewController {
                    destinationVC.selectedMeal = selectedMeal
                }
            }
        }
    }
    
    func loadDataTable(){
        mealViewModel.fetchMeals() { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.mealsTableView.reloadData()
                        if let nextMealIndex = self.mealViewModel.indexOfNextMeal() {
                            let indexPath = IndexPath(row: nextMealIndex, section: 0)
                            self.mealsTableView.scrollToRow(at: indexPath, at: .top, animated: true)
                        }
                    
                case .failure(let error):
                   print("Error: \(error)")
               }
           }
       }
    }

    

    func setUserInterfaceStyle(forWindowScene windowScene: UIWindowScene, lightMode: Bool) {
        if #available(iOS 13.0, *) {
            windowScene.windows.first?.overrideUserInterfaceStyle = lightMode ? .light : .dark
        }
    }
    
    
    
    @IBAction func listAllButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toListVC", sender: nil)
        
    }
    

    
    
    
}

