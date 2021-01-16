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
    
    func getDetails() -> [String] {
        return ["Height: \(self.height!)", "Mass: \(self.mass!)", "Hair Color: \(self.hairColor!)", "Skin Color: \(self.skinColor!)", "Eye Color: \(self.eyeColor!)", "Birth Year: \(self.birthYear!)", "Gender: \(self.gender!)"]//, "Homeworld: \(NetworkManager.shared.planetURLDictionary[self.homeworld!]?.name ?? "")", "Films: \(self.films!.joined(separator: ", "))", "Species: \(self.species!.joined(separator: ", "))", "Vehicles: \(self.vehicles!.joined(separator: ", "))", "Starships: \(self.starships!.joined(separator: ", "))"]
    }
//    
//    func getLists() -> [String] {
//        var lists = [String]()
//        var tempString = "Films:"
//        for film in self.films! {
//            tempString.append(" \(NetworkManager.shared.filmURLDictionary[film]?.title ?? "")")
//        }
//        lists.append(tempString)
//        tempString = "Species:"
//        for species in self.species! {
//            tempString.append(" \(NetworkManager.shared.speciesURLDictionary[species]?.name ?? "")")
//        }
//        lists.append(tempString)
//        tempString = "Starships:"
//        for starship in self.starships! {
//            tempString.append(" \(NetworkManager.shared.starshipURLDictionary[starship]?.name ?? "")")
//        }
//        lists.append(tempString)
//        tempString = "Vehicles:"
//        for vehicle in self.vehicles! {
//            tempString.append(" \(NetworkManager.shared.vehicleURLDictionary[vehicle]?.name ?? "")")
//        }
//        lists.append(tempString)
//        return lists
//    }
    
}
