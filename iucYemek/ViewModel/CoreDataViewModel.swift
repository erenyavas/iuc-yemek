//
//  CoreDataViewModel.swift
//  iucYemek
//
//  Created by Eren Yavaş on 2.11.2023.
//

import Foundation

class CoreDataViewModel {
    var mealsRatings: [MealsRatings] = []
    
    func getAllMealsRatings() {
        mealsRatings = CoreDataManager.shared.fetchAllMealsRatings()
    }
    
    func saveNewMealsRating(name: String, rating: Double) {
        CoreDataManager.shared.createOrUpdateMealsRating(name: name, newRating: rating)
    }
    
    func deleteAllMealsRatings() {
        CoreDataManager.shared.deleteAllMealsRatings()
       
        getAllMealsRatings()
    }
    
    func numberOfMealsRatings() -> Int {
        return mealsRatings.count
    }
    
    func mealsRating(at index: Int) -> MealsRatings {
        return mealsRatings[index]
    }
    
    
}
