//
//  Planet.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/16/21.
//

import Foundation

class Planet: Codable {
    
    var name: String?
    var rotationPeriod: String?
    var orbitalPeriod: String?
    var diameter: String?
    var climate: String?
    var gravity: String?
    var terrain: String?
    var surfaceWater: String?
    var population: String?
    var residents: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
    
}

extension Planet: Detailable {
    
    func getDetails() -> [String] {
        return ["Name: \(self.name ?? "")", "Rotation Perios: \(self.rotationPeriod ?? "")", "Orbital Period: \(self.orbitalPeriod ?? "")", "Diameter: \(self.diameter ?? "")", "Climate: \(self.climate ?? "")", "Gravity: \(self.gravity ?? "")", "Terrain: \(self.terrain ?? "")", "Surface Water: \(self.surfaceWater ?? "")", "Population: \(self.population ?? "")"]
    }
    
    func getMoreInfo() -> [Constants.SWCategory: [String]] {
        return [.people: self.residents ?? [], .films: self.films ?? []]
    }
    
}
