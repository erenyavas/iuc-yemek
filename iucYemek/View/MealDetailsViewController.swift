//
//  MealDetailsViewController.swift
//  iucYemek
//
//  Created by Eren Yavaş on 1.11.2023.
//

import UIKit
import Cosmos

class MealDetailsViewController: UIViewController {
    
    let coreDataViewModal = CoreDataViewModel()
    let mealViewModel = MealViewModel()
    
    var selectedMeal: Meal?
    
    @IBOutlet weak var mainMealLabel: UILabel!
    @IBOutlet weak var sideMealLabel: UILabel!
    @IBOutlet weak var soupLabel: UILabel!
    @IBOutlet weak var aperativeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var calorieLabel: UILabel!
    @IBOutlet weak var dateDayLabel: UILabel!
    
    
    @IBOutlet weak var mainMealRating: CosmosView!
    @IBOutlet weak var sideMealRating: CosmosView!
    @IBOutlet weak var soupRating: CosmosView!
    @IBOutlet weak var aperativeRating: CosmosView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        mainMealLabel.text = selectedMeal?.meals.mainMeal
        sideMealLabel.text = selectedMeal?.meals.sideMeal
        soupLabel.text = selectedMeal?.meals.soup
        aperativeLabel.text = selectedMeal?.meals.aperative
        dateLabel.text = selectedMeal?.day
        calorieLabel.text = selectedMeal?.meals.calorie
        dateDayLabel.text = mealViewModel.getDayNameForDate(dateString: selectedMeal!.day)
        
        if let mainMealRating =  selectedMeal?.meals.mainMealRating ?? Optional(1){
            self.mainMealRating.rating = mainMealRating
        }
        if let sideMealRating =  selectedMeal?.meals.sideMealRating ?? Optional(1){
            self.sideMealRating.rating = sideMealRating
        }
        if let soupRating =  selectedMeal?.meals.soupRating ?? Optional(1){
            self.soupRating.rating = soupRating
        }
        if let aperetiveRating =  selectedMeal?.meals.aperativeRating ?? Optional(1){
            self.aperativeRating.rating = aperetiveRating
        }
            
    }
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        coreDataViewModal.saveNewMealsRating(name: mainMealLabel.text!, rating: mainMealRating.rating)
        coreDataViewModal.saveNewMealsRating(name: sideMealLabel.text!, rating: sideMealRating.rating)
        coreDataViewModal.saveNewMealsRating(name: soupLabel.text!, rating: soupRating.rating)
        coreDataViewModal.saveNewMealsRating(name: aperativeLabel.text!, rating: aperativeRating.rating)
        
        
        navigationController?.popToRootViewController(animated: true)
    }
}
