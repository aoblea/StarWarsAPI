//
//  SpeciesViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/17/21.
//

struct SpeciesViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .species
    var features: [Feature] = []
    
    // MARK: - Init
    init(species: Species) {
        self.features = [
            Feature(title: "Classification:", description: species.classification),
            Feature(title: "Designation:", description: species.designation),
            Feature(title: "Average Height:", description: species.averageHeight),
            Feature(title: "Skin Colors:", description: species.skinColors),
            Feature(title: "Hair Colors:", description: species.hairColors),
            Feature(title: "Eye Colors:", description: species.eyeColors),
            Feature(title: "Average Lifespan:", description: species.averageLifespan),
            Feature(title: "Home World:", description: species.homeworld ?? "No Home World"),
            Feature(title: "Language:", description: species.language),
            Feature(title: "People:", description: species.people.joined()),
            Feature(title: "Films:", description: species.films.joined()),
            Feature(title: "Created:", description: species.created),
            Feature(title: "Edited:", description: species.edited),
            Feature(title: "URL:", description: species.url)
        ]
    }
}
