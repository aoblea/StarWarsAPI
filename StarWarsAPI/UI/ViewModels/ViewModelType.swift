//
//  ViewModelType.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/16/21.
//

protocol ViewModelType {
    var type: StarWarsEndpoint { get }
    var features: [Feature] { get }
}
