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
    let meals: Meals
}

// MARK: - Meals
struct Meals: Codable {
    let anaYemek, yanYemek, corba, aperatif: String
    let kalori: String
    let ekstra: String?

    enum CodingKeys: String, CodingKey {
        case anaYemek = "Ana Yemek"
        case yanYemek = "Yan Yemek"
        case corba = "Çorba"
        case aperatif = "Aperatif"
        case kalori = "Kalori"
        case ekstra = "Ekstra"
    }
}
