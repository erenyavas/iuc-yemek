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

    func fetchMeals(completion: @escaping (Result<[Meal], MealError>) -> Void) {
        apiService.fetchData(url: URL(string: "https://iuc.ahmetcan.ninja")!) { result in
            switch result {
            case .success(let mealList):
                self.meals = mealList
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
}
