//
//  StarWarsEndpoint.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

import Foundation

// MARK: - Endpoints
enum StarWarsEndpoint {
    case films
    case people
    case planets
    case species
    case starships
    case vehicles
}

// MARK: - Local properties
extension StarWarsEndpoint {
    var localizedDescription: String {
        switch self {
        case .films: return "Films"
        case .people: return "People"
        case .planets: return "Planets"
        case .species: return "Species"
        case .starships: return "Starships"
        case .vehicles: return "Vehicles"
        }
    }
    
    var imageString: String {
        switch self {
        case .films: return "icon-films"
        case .people: return "icon-characters"
        case .planets: return "icon-planets"
        case .species: return "icon-species"
        case .starships: return "icon-starships"
        case .vehicles: return "icon-vehicles"
        }
    }
    
    var request: URLRequest {
        let request = URLRequest(url: urlComponents.url!)
        return request
    }
}

// MARK: - Identifiable
extension StarWarsEndpoint: Identifiable {
    var id: Self { return self }
}

// MARK: - Private
private extension StarWarsEndpoint {
    var base: String {
        return "https://swapi.dev"
    }
    
    var path: String {
        switch self {
        case .films:
            return "/api/films/"
        case .people:
            return "/api/people/"
        case .planets:
            return "/api/planets/"
        case .species:
            return "/api/species/"
        case .starships:
            return "/api/starships/"
        case .vehicles:
            return "/api/vehicles/"
        }
    }
    
    var queryItems: [URLQueryItem] { return [] }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
    }
}
