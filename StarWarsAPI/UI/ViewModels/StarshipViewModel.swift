//
//  StarshipViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/17/21.
//

struct StarshipViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .starships
    var features: [Feature] = []
    
    // MARK: - Init
    init(starship: Starship) {
        self.features = [
            Feature(title: "Model:", description: starship.model),
            Feature(title: "Manufacturer:", description: starship.manufacturer),
            Feature(title: "Cost In Credits:", description: starship.costInCredits),
            Feature(title: "Length:", description: starship.length),
            Feature(title: "Max Atmosphering Speed:", description: starship.maxAtmospheringSpeed),
            Feature(title: "Crew:", description: starship.crew),
            Feature(title: "Passengers:", description: starship.passengers),
            Feature(title: "Cargo Capacity", description: starship.cargoCapacity),
            Feature(title: "Consumables:", description: starship.consumables),
            Feature(title: "Hyper Driving Rating:", description: starship.hyperdriveRating),
            Feature(title: "MGLT:", description: starship.MGLT),
            Feature(title: "Starship Class:", description: starship.starshipClass),
            
            Feature(title: "Pilots:", description: starship.pilots.joined()),
            
            Feature(title: "Films:", description: starship.films.joined()),
            Feature(title: "Created:", description: starship.created),
            Feature(title: "Edited:", description: starship.edited),
            Feature(title: "URL:", description: starship.url)
        ]
    }
}
