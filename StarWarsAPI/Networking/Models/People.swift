//
//  People.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct People: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
}

struct Person: Decodable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Person: Identifiable {
    var id: String { return self.name }
}

// MARK: - Default Init
extension Person {
    init() {
        self.name = ""
        self.height = ""
        self.mass = ""
        self.hairColor = ""
        self.skinColor = ""
        self.eyeColor = ""
        self.birthYear = ""
        self.gender = ""
        self.homeworld = ""
        self.films = [""]
        self.species = [""]
        self.vehicles = [""]
        self.starships = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
