//
//  ListViewController.swift
//  iucYemek
//
//  Created by Eren Yavaş on 2.11.2023.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var listTableView: UITableView!
    
    let coreDataViewModel = CoreDataViewModel()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        coreDataViewModel.getAllMealsRatings()        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataViewModel.numberOfMealsRatings()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        let mealsRating = coreDataViewModel.mealsRating(at: indexPath.row)
        content.text = mealsRating.name
        content.secondaryText = "\(mealsRating.rating)"
        cell.contentConfiguration = content
        return cell
    }
    
    


}
