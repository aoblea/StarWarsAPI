//
//  Planets.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct Planets: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]
}

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Planet: Identifiable {
    var id: String { return self.name }
}

// MARK: - Default Init
extension Planet {
    init() {
        self.name = ""
        self.rotationPeriod = ""
        self.orbitalPeriod = ""
        self.diameter = ""
        self.climate = ""
        self.gravity = ""
        self.terrain = ""
        self.surfaceWater = ""
        self.population = ""
        self.residents = [""]
        self.films = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
