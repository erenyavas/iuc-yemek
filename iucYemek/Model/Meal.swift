//
//  Meal.swift
//  iucYemek
//
//  Created by Eren Yavaş on 29.10.2023.
//

import Foundation




// MARK: - Meal
struct Meal: Codable {
    let day: String
    var meals: Meals
}

// MARK: - Meals
struct Meals: Codable {
    let mainMeal, sideMeal, soup, aperative: String
    let calorie: String
    let extra: String?
    var mainMealRating, sideMealRating, soupRating, aperativeRating: Double?
    var mainMealRatingId, sideMealRatingId, soupRatingId, aperativeRatingId: UUID?

    enum CodingKeys: String, CodingKey {
        case mainMeal = "Ana Yemek"
        case sideMeal = "Yan Yemek"
        case soup = "Çorba"
        case aperative = "Aperatif"
        case calorie = "Kalori"
        case extra = "Ekstra"
    }
}

