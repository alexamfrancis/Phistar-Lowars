//
//  Person.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import Foundation

class Person: Codable {
    
    var name: String?
    var height: String?
    var mass: String?
    var hairColor: String?
    var skinColor: String?
    var eyeColor: String?
    var birthYear: String?
    var gender: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var vehicles: [String]?
    var starships: [String]?
    var created: String?
    var edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case starships
        case created
        case edited
        case url
    }
    
}

extension Person: Detailable {
    
    func getDetails() -> [String] {
        return ["Height: \(self.height ?? "")", "Mass: \(self.mass ?? "")", "Hair Color: \(self.hairColor ?? "")", "Skin Color: \(self.skinColor ?? "")", "Eye Color: \(self.eyeColor ?? "")", "Birth Year: \(self.birthYear ?? "")", "Gender: \(self.gender ?? "")"]
    }
    
    func getMoreInfo() -> [Constants.SWCategory: [String]] {
        return [.films: self.films ?? [], .planets: [self.homeworld ?? "N/A"], .starships: self.starships ?? [], .vehicles: self.vehicles ?? [], .species: self.species ?? []]
    }
    
}
