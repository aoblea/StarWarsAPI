//
//  Films.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

struct Films: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]
}

struct Film: Decodable {
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

// MARK: - Identifiable
extension Film: Identifiable {
    var id: String { return self.title }
}

// MARK: - Default Init
extension Film {
    init() {
        self.title = ""
        self.episodeId = 0
        self.openingCrawl = ""
        self.director = ""
        self.producer = ""
        self.releaseDate = ""
        self.characters = [""]
        self.planets = [""]
        self.starships = [""]
        self.vehicles = [""]
        self.species = [""]
        self.created = ""
        self.edited = ""
        self.url = ""
    }
}
