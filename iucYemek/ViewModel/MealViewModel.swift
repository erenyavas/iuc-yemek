//
//  MealViewModel.swift
//  iucYemek
//
//  Created by Eren Yavaş on 29.10.2023.
//

import Foundation

class MealViewModel {
    private var meals: [Meal] = []
    private let apiService = ApiService()
    private let coreDataViewModel = CoreDataViewModel()

    func fetchMeals(completion: @escaping (Result<[Meal], MealError>) -> Void) {
        apiService.fetchData(url: URL(string: "https://iuc.ahmetcan.ninja")!) { result in
            switch result {
            case .success(let mealList):
                
//                self.coreDataViewModel.deleteAllMealsRatings()
                
                self.meals = mealList
                self.coreDataViewModel.getAllMealsRatings()
                let mealsRatings = self.coreDataViewModel.mealsRatings
                self.addRatingsToMeals(mealsRatings: mealsRatings)
                
                
                
                completion(.success(mealList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func numberOfMeals() -> Int {
        return meals.count
    }

    func meal(at index: Int) -> Meal {
        return meals[index]
    }
    
    
    func indexOfNextMeal() -> Int? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDate = dateFormatter.string(from: Date())

        var closestNextDate: Date? = nil
        var closestNextIndex: Int? = nil

        for (index, meal) in meals.enumerated() {
            if let date = dateFormatter.date(from: meal.day) {
                if let formattedCurrentDate = dateFormatter.date(from: currentDate) {
                    if date >= formattedCurrentDate {
                        if closestNextDate == nil || date < closestNextDate! {
                            closestNextDate = date
                            closestNextIndex = index
                        }
                    }
                }
            }
        }

        if closestNextDate != nil {
            return closestNextIndex
        } else {
            // No meals found with dates equal to or greater than the current date,
            // so return the index of the last meal
            return meals.indices.last
        }
    }



    
    func getDayNameForDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "tr_TR")
        
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            let dayName = dateFormatter.weekdaySymbols[dayOfWeek - 1]
            return dayName
        } else {
            return "Invalid date format"
        }
    }

    func addRatingsToMeals(mealsRatings: [MealsRatings]) {
         for (mealIndex, meal) in meals.enumerated() {
             for rating in mealsRatings {
                 if meal.meals.mainMeal == rating.name {
                     meals[mealIndex].meals.mainMealRating = rating.rating
                     meals[mealIndex].meals.mainMealRatingId = rating.id
                 }
                 if meal.meals.sideMeal == rating.name {
                     meals[mealIndex].meals.sideMealRating = rating.rating
                     meals[mealIndex].meals.sideMealRatingId = rating.id
                 }
                 if meal.meals.soup == rating.name {
                     meals[mealIndex].meals.soupRating = rating.rating
                     meals[mealIndex].meals.soupRatingId = rating.id
                 }
                 if meal.meals.aperative == rating.name {
                     meals[mealIndex].meals.aperativeRating = rating.rating
                     meals[mealIndex].meals.aperativeRatingId = rating.id
                 }
             }
         }
     }


    
}
