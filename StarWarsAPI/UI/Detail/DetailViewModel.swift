//
//  DetailViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/1/21.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    
    // MARK: - Published
    @Published var films: [Film] = []
    @Published var people: [Person] = []
    @Published var planets: [Planet] = []
    @Published var species: [Species] = []
    @Published var starships: [Starship] = []
    @Published var vehicles: [Vehicle] = []

    @Published var isFetching = false
    @Published var isUpdating = false
    
    let selection: StarWarsEndpoint
    var model: ViewModelType?
    var pickerSelection: String = "" {
        didSet {
            print("PICKER SELECTION: \(pickerSelection)")
            updateViews(using: selection)
        }
    }
    var topComparison: Comparison = Comparison(title: "", description: "")
    var bottomComparison: Comparison = Comparison(title: "", description: "")
    
    // MARK: - Private Properties
    private(set) lazy var networkManager: NetworkManager = NetworkManager()
    private(set) var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Init
    init(selectedRow: StarWarsEndpoint) {
        self.selection = selectedRow
        
        setDefault(using: selectedRow)
    }
    
    // MARK: - Methods
    func updateViews(using selection: StarWarsEndpoint) {
        isUpdating = true
        
        switch selection {
        case .films:
            let filteredFilm = films.filter({ film in
                if film.title == pickerSelection {
                    return true
                }
                return false
            })
            model = FilmViewModel(film: filteredFilm.first!)
            isUpdating = false
        case .people:
            let filteredPerson = people.filter({ person in
                if person.name == pickerSelection {
                    return true
                }
                return false
            })
            model = PersonViewModel(person: filteredPerson.first!)
            isUpdating = false
        case .planets:
            let filteredPlanet = planets.filter({ planet in
                if planet.name == pickerSelection {
                    return true
                }
                return false
            })
            model = PlanetViewModel(planet: filteredPlanet.first!)
            isUpdating = false
        case .species:
            let filteredSpecies = species.filter({ species in
                if species.name == pickerSelection {
                    return true
                }
                return false
            })
            model = SpeciesViewModel(species: filteredSpecies.first!)
            isUpdating = false
        case .starships:
            let filteredStarship = starships.filter({ starship in
                if starship.name == pickerSelection {
                    return true
                }
                return false
            })
            model = StarshipViewModel(starship: filteredStarship.first!)
            isUpdating = false
        case .vehicles:
            let filteredVehicle = vehicles.filter({ vehicle in
                if vehicle.name == pickerSelection {
                    return true
                }
                return false
            })
            model = VehicleViewModel(vehicle: filteredVehicle.first!)
            isUpdating = false
        }
    }
    
    func getData() {
        self.isFetching = true
        print("GETTING DATA FOR: \(selection)")

        getData(for: selection)
    }
    
}

// MARK: - Private
private extension DetailViewModel {
    func setDefault(using selectedRow: StarWarsEndpoint) {
        switch selectedRow {
        case .films:
            model = FilmViewModel(film: Film())
        case .people:
            model = PersonViewModel(person: Person())
        case .planets:
            model = PlanetViewModel(planet: Planet())
        case .species:
            model = SpeciesViewModel(species: Species())
        case .starships:
            model = StarshipViewModel(starship: Starship())
        case .vehicles:
            model = VehicleViewModel(vehicle: Vehicle())
        }
    }
    
    func getData(for selection: StarWarsEndpoint) {
        switch selection {
        case .films:
            networkManager.getFilms()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET FILMS ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.films = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = FilmViewModel(film: firstResult)
                    
                    // Find First and Last Movie
                    let sortedFilms = response.results.sorted { $0.episodeId < $1.episodeId ? true : false }
                    guard let firstFilmTitle = sortedFilms.first?.title else { return }
                    guard let lastFilmTitle = sortedFilms.last?.title else { return }
                    self.topComparison = Comparison(title: "First:", description: firstFilmTitle)
                    self.bottomComparison = Comparison(title: "Last:", description: lastFilmTitle)
                }
                .store(in: &cancellables)

        case .people:
            networkManager.getPeople()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET PEOPLE ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.people = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = PersonViewModel(person: firstResult)
                    
                    // Find Shortest and Tallest
                    let sortedPeople = response.results.sorted { first, last in
                        guard let short = Int(first.height) else { return false }
                        guard let tall = Int(last.height) else { return false }
                        return short < tall ? true : false
                    }
                    guard let shortestPerson = sortedPeople.first?.name else { return }
                    guard let tallestPerson = sortedPeople.last?.name else { return }
                    self.topComparison = Comparison(title: "Shortest:", description: shortestPerson)
                    self.bottomComparison = Comparison(title: "Tallest:", description: tallestPerson)
                }
                .store(in: &cancellables)

        case .planets:
            networkManager.getPlanets()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET PLANETS ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.planets = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = PlanetViewModel(planet: firstResult)
                    
                    // Find Smallest and Largest
                    let sortedPlanets = response.results.sorted { first, last in
                        guard let small = Int(first.diameter) else { return false }
                        guard let big = Int(last.diameter) else { return false }
                        return small < big ? true : false
                    }
                    guard let smallestPlanet = sortedPlanets.first?.name else { return }
                    guard let largestPlanet = sortedPlanets.last?.name else { return }
                    self.topComparison = Comparison(title: "Smallest:", description: smallestPlanet)
                    self.bottomComparison = Comparison(title: "Largest:", description: largestPlanet)
                }
                .store(in: &cancellables)

        case .species:
            networkManager.getSpecies()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET SPECIES ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.species = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = SpeciesViewModel(species: firstResult)
                    
                    // Find Shortest and Tallest
                    let filteredSpecies = response.results.filter { $0.averageHeight != "n/a" }
                    let sortedSpecies = filteredSpecies.sorted { first, last in
                        guard let short = Int(first.averageHeight) else { return false }
                        guard let tall = Int(last.averageHeight) else { return false }
                        return short < tall ? true : false
                    }
                    guard let shortestSpecies = sortedSpecies.first?.name else { return }
                    guard let tallestSpecies = sortedSpecies.last?.name else { return }
                    self.topComparison = Comparison(title: "Shortest:", description: shortestSpecies)
                    self.bottomComparison = Comparison(title: "Tallest:", description: tallestSpecies)
                }
                .store(in: &cancellables)

        case .starships:
            networkManager.getStarships()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET STARSHIPS ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.starships = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = StarshipViewModel(starship: firstResult)
                    
                    // Find Smallest and Largest
                    let sortedStarships = response.results.sorted { first, last in
                        guard let small = Int(first.length) else { return false }
                        guard let big = Int(last.length) else { return false }
                        return small < big ? true : false
                    }
                    guard let smallestStarship = sortedStarships.first?.name else { return }
                    guard let largestStarship = sortedStarships.last?.name else { return }
                    self.topComparison = Comparison(title: "Smallest:", description: smallestStarship)
                    self.bottomComparison = Comparison(title: "Largest:", description: largestStarship)
                }
                .store(in: &cancellables)

        case .vehicles:
            networkManager.getVehicles()
                .sink { completion in
                    switch completion {
                    case .failure(let error): print("GET VEHICLES ERROR: \(error.localizedDescription)")
                    case .finished: self.isFetching = false
                    }
                } receiveValue: { response in
                    self.vehicles = response.results
                    
                    guard let firstResult = response.results.first else { return }
                    self.model = VehicleViewModel(vehicle: firstResult)
                    
                    // Find Smallest and Largest
                    let sortedVehicles = response.results.sorted { first, last in
                        guard let small = Int(first.length) else { return false }
                        guard let big = Int(last.length) else { return false }
                        return small < big ? true : false
                    }
                    guard let smallestVehicle = sortedVehicles.first?.name else { return }
                    guard let largestVehicle = sortedVehicles.last?.name else { return }
                    self.topComparison = Comparison(title: "Smallest:", description: smallestVehicle)
                    self.bottomComparison = Comparison(title: "Largest:", description: largestVehicle)
                }
                .store(in: &cancellables)

        }
    }
}
