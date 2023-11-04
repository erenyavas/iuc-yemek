# İÜC Yemek
İÜC Yemek is a Swift application that helps you check and rate İstanbul Üniversitesi-Cerrahpaşa cafeteria meals. It provides features to fetch meal data from API, view meal details, and rate individual meal components.


## Features

- **Meal Data**: Fetches meal data from API using the `ApiService` and displays it in a table view.
- **Meal Ratings**: Allows users to rate individual meal components (main meal, side meal, soup, aperetive) using CosmosView.
- **View Details**: Displays detailed information about a selected meal, including its components and ratings.


## Project Structure

The project is organized into several key components:

- **`ApiService.swift`**: Handles fetching meal list data from the [API](https://github.com/cahmetcan/iuc-yemekhane-scrape).

- **`Meal.swift`**: Defines the data structure for meals.

- **`MealViewModel.swift`**: Manages meal data and ratings.

- **`MealsTableViewCell.swift`**: A custom table view cell for displaying meal information and ratings.

- **`MealDetailsViewController.swift`**: Displays detailed information about a selected meal and allows users to rate meal components.

- **`ListViewController.swift`**: Lists and displays meal ratings stored in Core Data.

- **`CoreDataManager.swift`**: Manages Core Data operations for storing and retrieving meal ratings.

- **`CoreDataViewModel.swift`**: Interacts with Core Data to manage meal ratings.

## Screenshots

<img src="https://github.com/erenyavas/iuc-yemek/assets/69438893/12c2191f-0f9a-4afe-ad5d-03f4539fee01" height="500">
<img src="https://github.com/erenyavas/iuc-yemek/assets/69438893/21ee35cb-9c5d-4394-a639-8ccfe8032a81" height="500">
<img src="https://github.com/erenyavas/iuc-yemek/assets/69438893/2cf7c2b8-c86e-41d5-a486-54d88bbed10e" height="500">


## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request with your changes.
