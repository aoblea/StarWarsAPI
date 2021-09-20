//
//  VehicleViewModel.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/17/21.
//

struct VehicleViewModel: ViewModelType {
    
    // MARK: - Properties
    var type: StarWarsEndpoint = .vehicles
    var features: [Feature] = []
    
    // MARK: - Init
    init(vehicle: Vehicle) {
        self.features = [
            Feature(title: "Model:", description: vehicle.model),
            Feature(title: "Manufacturer:", description: vehicle.manufacturer),
            Feature(title: "Cost In Credits:", description: vehicle.costInCredits),
            Feature(title: "Length:", description: vehicle.length),
            Feature(title: "Max Atmosphering Speed:", description: vehicle.maxAtmospheringSpeed),
            Feature(title: "Crew", description: vehicle.crew),
            Feature(title: "Passengers:", description: vehicle.passengers),
            Feature(title: "Cargo Capacity:", description: vehicle.cargoCapacity),
            Feature(title: "Consumables", description: vehicle.consumables),
            Feature(title: "Vehicle Class:", description: vehicle.vehicleClass),
            Feature(title: "Pilots:", description: vehicle.pilots.joined())
        ]
    }
}
