//
//  Species.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct SpeciesResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Species]
}

struct Species: Decodable {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Species: Identifiable {
    var id: String { return self.name }
}

// MARK: - Default Init
extension Species {
    init() {
        self.name = ""
        self.classification = ""
        self.designation = ""
        self.averageHeight = ""
        self.skinColors = ""
        self.hairColors = ""
        self.eyeColors = ""
        self.averageLifespan = ""
        self.homeworld = ""
        self.language = ""
        self.people = [""]
        self.films = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
