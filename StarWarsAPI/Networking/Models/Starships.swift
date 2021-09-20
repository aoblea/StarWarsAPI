//
//  Starships.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct Starships: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}

struct Starship: Decodable {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Starship: Identifiable {
    var id: String { return self.name }
}

// MARK: - Default Init
extension Starship {
    init() {
        self.name = ""
        self.model = ""
        self.manufacturer = ""
        self.costInCredits = ""
        self.length = ""
        self.maxAtmospheringSpeed = ""
        self.crew = ""
        self.passengers = ""
        self.cargoCapacity = ""
        self.consumables = ""
        self.hyperdriveRating = ""
        self.MGLT = ""
        self.starshipClass = ""
        self.pilots = [""]
        self.films = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
