//
//  StarWarsAPITests.swift
//  StarWarsAPITests
//
//  Created by Arwin Oblea on 8/25/21.
//

import XCTest
@testable import StarWarsAPI
import Combine

class StarWarsAPITests: XCTestCase {
    // MARK: - Tests for NetworkError
    func test_NetworkErrorLocalizedDescription_areEqual() {
        let sut: [NetworkError] = [.urlError, .responseUnsuccessful, .statusCodeError, .decodingFailed]
        
        XCTAssertEqual(sut.map{$0.localizedDescription}, ["URL Error", "Response Unsuccessful", "Status code error", "Decoding failure"], "The descriptions should match.")
    }
    
    // MARK: - Tests for StarWarsEndpoint.swift
    func test_StarWarsEndpointLocalizedDescription_areEqual() {
        let sut: [StarWarsEndpoint] = [.films, .people, .planets, .species, .starships, .vehicles]
        
        XCTAssertEqual(sut.map{$0.localizedDescription}, ["Films", "People", "Planets", "Species", "Starships", "Vehicles"], "The descriptions should match.")
    }
    
    func test_StarWarsEndpointImageString_areEqual() {
        let sut: [StarWarsEndpoint] = [.films, .people, .planets, .species, .starships, .vehicles]
        
        XCTAssertEqual(sut.map{$0.imageString}, ["icon-films", "icon-characters", "icon-planets", "icon-species", "icon-starships", "icon-vehicles"], "The imageStrings should match.")
    }
    
//    https://swapi.dev/api/films/?, https://swapi.dev/api/people/?, https://swapi.dev/api/planets/?, https://swapi.dev/api/species/?, https://swapi.dev/api/starships/?, https://swapi.dev/api/vehicles/?
    func test_StarWarsEndpointRequests_areEqual() {
        let sut: [StarWarsEndpoint] = [.films, .people, .planets, .species, .starships, .vehicles]
        
        XCTAssertEqual(sut.map{$0.request.description}, ["https://swapi.dev/api/films/?", "https://swapi.dev/api/people/?", "https://swapi.dev/api/planets/?", "https://swapi.dev/api/species/?", "https://swapi.dev/api/starships/?", "https://swapi.dev/api/vehicles/?"], "The request urls should match.")
    }
}
