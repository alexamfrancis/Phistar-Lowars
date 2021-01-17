//
//  Starship.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import Foundation

class Starship: Codable {
    
    var name: String?
    var model: String?
    var manufacturer: String?
    var costInCredits: String?
    var length: String?
    var maxAtmospheringSpeed: String?
    var crew: String?
    var passengers: String?
    var cargoCapacity: String?
    var consumables: String?
    var hyperdriveRating: String?
    var mglt: String?
    var starshipClass: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case mglt = "MGLT"
        case starshipClass = "starship_class"
        case pilots
        case films
        case created
        case edited
        case url
    }

}

extension Starship: Detailable {
    
    func getDetails() -> [String] {
        return ["Name: \(self.name!)", "Model: \(self.model!)", "Manufacturer: \(self.manufacturer!)", "Cost in Credits: \(self.costInCredits!)", "Length: \(self.length!)", "Max Atmosphering Speed: \(self.maxAtmospheringSpeed!)", "Crew: \(self.crew!)", "Passengers: \(self.passengers!)", "Cargo Capacity: \(self.cargoCapacity!)", "Consumables: \(self.consumables!)", "Hyperdrive Rating: \(self.hyperdriveRating!)", "MGLT: \(self.mglt!)", "Starship Class: \(self.starshipClass!)"]
    }
    
    func getMoreInfo() -> [String: [String]] {
        return [Constants.CATEGORY_PERSON: self.pilots ?? [], Constants.CATEGORY_FILM: self.films ?? []]
    }
    
}
