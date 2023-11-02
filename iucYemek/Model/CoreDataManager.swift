//
//  CoreDataManager.swift
//  iucYemek
//
//  Created by Eren Yavaş on 2.11.2023.
//

import Foundation


import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
   
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MealsRatingDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        return container
    }()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        let context = viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error)")
            }
        }
    }

    func createOrUpdateMealsRating(name: String, newRating: Double) {
        let context = viewContext

        // Fetch the existing MealsRatings entity by name
        let fetchRequest: NSFetchRequest<MealsRatings> = MealsRatings.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            if let existingRating = try context.fetch(fetchRequest).first {
                // update the rating
                existingRating.rating = newRating
            } else {
                // create a new one
                let newMeal = MealsRatings(context: context)
                newMeal.id = UUID()
                newMeal.name = name
                newMeal.rating = newRating
            }

            try context.save()
        } catch {
            print("Error creating or updating rating: \(error)")
        }
    }

    
    func deleteAllMealsRatings() {
        let context = viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MealsRatings")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
               try context.execute(deleteRequest)
               try context.save()
           } catch {
               print("Error deleting all MealsRatings: \(error)")
           }
    }
    
    
    func fetchAllMealsRatings() -> [MealsRatings] {
        let context = viewContext
        let fetchRequest: NSFetchRequest<MealsRatings> = MealsRatings.fetchRequest()
        
        do {
            let mealsRatings = try context.fetch(fetchRequest)
            return mealsRatings
        } catch {
            print("Error fetching meals ratings: \(error)")
            return []
        }
    }

}
