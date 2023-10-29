//
//  ApiService.swift
//  iucYemek
//
//  Created by Eren Yavaş on 29.10.2023.
//

import Foundation

enum MealError : Error {
    case serverError
    case decodingError
    case URLError
}

class ApiService {
    
    func fetchData(url: URL, completion: @escaping (Result<[Meal],MealError>)->()) {
           
           URLSession.shared.dataTask(with: url) { data, response, error in
               if error != nil {
                   completion(.failure(.serverError))
               } else if let data = data {
                   
                   let mealList = try? JSONDecoder().decode([Meal].self, from: data)
                   
                   if let mealList = mealList {
                       completion(.success(mealList))
                   } else {
                       completion(.failure(.decodingError))
                   }
               }
           }.resume()
       }
    
}
