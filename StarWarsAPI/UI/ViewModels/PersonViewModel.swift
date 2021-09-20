//
//  PersonViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/16/21.
//

struct PersonViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .people
    var features: [Feature] = []
    
    // MARK: - Init
    init(person: Person) {
        self.features = [
            Feature(title: "Height:", description: person.height),
            Feature(title: "Mass:", description: person.mass),
            Feature(title: "Hair Color:", description: person.hairColor),
            Feature(title: "Skin Color:", description: person.skinColor),
            Feature(title: "Eye Color:", description: person.eyeColor),
            Feature(title: "Birth Year:", description: person.birthYear),
            Feature(title: "Gender:", description: person.gender),
            Feature(title: "Homeworld:", description: person.homeworld),
            Feature(title: "Films:", description: person.films.joined()),
            Feature(title: "Species:", description: person.species.joined()),
            Feature(title: "Vehicles:", description: person.vehicles.joined()),
            Feature(title: "Starships:", description: person.starships.joined()),
            Feature(title: "Created:", description: person.created),
            Feature(title: "Edited:", description: person.edited),
            Feature(title: "URL:", description: person.url)
        ]
    }
}
