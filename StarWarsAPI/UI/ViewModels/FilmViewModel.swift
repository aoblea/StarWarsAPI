//
//  FilmViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/17/21.
//

struct FilmViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .films
    var features: [Feature] = []

    // MARK: - Init
    init(film: Film) {
        self.features = [
            Feature(title: "Episode:", description: film.episodeId.description),
            Feature(title: "Opening Crawl:", description: film.openingCrawl),
            Feature(title: "Director:", description: film.director),
            Feature(title: "Producer:", description: film.producer),
            Feature(title: "Release Date:", description: film.releaseDate),
            Feature(title: "Characters:", description: film.characters.joined()),
            Feature(title: "Planets:", description: film.planets.joined()),
            Feature(title: "Starships:", description: film.starships.joined()),
            Feature(title: "Vehicles:", description: film.vehicles.joined()),
            Feature(title: "Species:", description: film.species.joined()),
            Feature(title: "Created:", description: film.created),
            Feature(title: "Edited:", description: film.edited),
            Feature(title: "URL:", description: film.url)
        ]
    }
}
