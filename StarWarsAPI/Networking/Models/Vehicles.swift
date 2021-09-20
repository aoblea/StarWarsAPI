//
//  Vehicles.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct Vehicles: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}

struct Vehicle: Decodable {
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
    let vehicleClass: String
    let pilots: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Vehicle: Identifiable {
    var id: String { return self.name }
}

// MARK: - Default Init
extension Vehicle {
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
        self.vehicleClass = ""
        self.pilots = [""]
        self.films = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
