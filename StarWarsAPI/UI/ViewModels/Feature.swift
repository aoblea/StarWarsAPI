//
//  Feature.swift
//  StarWarsAPI
//
//  Created by Arwin Oblea on 9/16/21.
//

struct Feature {
    let title: String
    let description: String
}

// MARK: - Identifiable
extension Feature: Identifiable {
    var id: String { self.title }
}
