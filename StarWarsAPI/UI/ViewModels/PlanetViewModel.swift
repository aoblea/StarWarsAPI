//
//  PlanetViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/17/21.
//

struct PlanetViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .planets
    var features: [Feature] = []
    
    // MARK: - Init
    init(planet: Planet) {
        self.features = [
            Feature(title: "Rotation Period:", description: planet.rotationPeriod),
            Feature(title: "Orbital Period:", description: planet.orbitalPeriod),
            Feature(title: "Diameter:", description: planet.diameter),
            Feature(title: "Climate:", description: planet.climate),
            Feature(title: "Gravity:", description: planet.gravity),
            Feature(title: "Terrain:", description: planet.terrain),
            Feature(title: "Surface Water:", description: planet.surfaceWater),
            Feature(title: "Population:", description: planet.population),
            Feature(title: "Residents:", description: planet.residents.joined()),
            Feature(title: "Films:", description: planet.films.joined()),
            Feature(title: "Created:", description: planet.created),
            Feature(title: "Edited:", description: planet.edited),
            Feature(title: "URL:", description: planet.url)
        ]
    }
}
