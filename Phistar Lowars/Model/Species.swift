//
//  Species.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import Foundation

class Species: Codable {

    var name: String?
    var classification: String?
    var designation: String?
    var averageHeight: String?
    var skinColors: String?
    var hairColors: String?
    var eyeColors: String?
    var averageLifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case created
        case edited
        case url
    }
    
}

extension Species: Detailable {
    
    func getDetails() -> [String] {
        return ["Name: \(self.name ?? "")", "Classification: \(self.classification ?? "")", "Designation: \(self.designation ?? "")", "Average Height: \(self.averageHeight ?? "")", "Skin Colors: \(self.skinColors ?? "")", "Hair Colors: \(self.hairColors ?? "")", "Eye Colors: \(self.eyeColors ?? "")", "Average Lifespan: \(self.averageLifespan ?? "")"]
    }
    
    func getMoreInfo() -> [Constants.SWCategory: [String]] {
        return [.people: self.people ?? [], .planets: [self.homeworld ?? "N/A"], .films: self.films ?? []]
    }
    
}
