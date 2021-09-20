//
//  NetworkManager.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 8/25/21.
//

import Foundation
import Combine

final class NetworkManager {
    private(set) lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

extension NetworkManager {
    func getFilms() -> AnyPublisher<Films, NetworkError> {
        let endpoint = StarWarsEndpoint.films
        let request = endpoint.request
        print("FILMS REQUEST: \(request)")

        return fetch(with: request)
    }

    func getPeople() -> AnyPublisher<People, NetworkError> {
        let endpoint = StarWarsEndpoint.people
        let request = endpoint.request
        print("PEOPLE REQUEST: \(request)")

        return fetch(with: request)
    }

    func getPlanets() -> AnyPublisher<Planets, NetworkError> {
        let endpoint = StarWarsEndpoint.planets
        let request = endpoint.request
        print("PLANET REQUEST: \(request)")

        return fetch(with: request)
    }

    func getSpecies() -> AnyPublisher<SpeciesResponse, NetworkError> {
        let endpoint = StarWarsEndpoint.species
        let request = endpoint.request
        print("SPECIES REQUEST: \(request)")

        return fetch(with: request)
    }

    func getStarships() -> AnyPublisher<Starships, NetworkError> {
        let endpoint = StarWarsEndpoint.starships
        let request = endpoint.request
        print("STARSHIPS REQUEST: \(request)")

        return fetch(with: request)
    }

    func getVehicles() -> AnyPublisher<Vehicles, NetworkError> {
        let endpoint = StarWarsEndpoint.vehicles
        let request = endpoint.request
        print("VEHICLES REQUEST: \(request)")

        return fetch(with: request)
    }
}

// MARK: - Private
private extension NetworkManager {    
    func fetch<T: Decodable>(with request: URLRequest) -> AnyPublisher<T, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .urlError }
            .flatMap { (data, response) -> AnyPublisher<T, NetworkError> in
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: .responseUnsuccessful).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: self.decoder)
                        .mapError { error in
                            print(error)
                            return .decodingFailed
                        }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: .statusCodeError).eraseToAnyPublisher()
                }
                
            }.eraseToAnyPublisher()
    }
}
