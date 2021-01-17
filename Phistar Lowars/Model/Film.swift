//
//  Film.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import Foundation

struct Film: Codable {
    
    var title: String?
    var episodeId: Int?
    var openingCrawl: String?
    var director: String?
    var producer: String?
    var releaseDate: String?
    var characters: [String]?
    var planets: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var species: [String]?
    var created: String?
    var edited: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
    }

}

extension Film: Detailable {
    
    func getDetails() -> [String] {
        return ["Title: \(self.title!)", "Episode ID: \(self.episodeId!)", "Opening Crawl: \(self.openingCrawl!)", "Director: \(self.director!)", "Producer: \(self.producer!)", "Release Date: \(self.releaseDate!)"]
    }
    
    func getMoreInfo() -> [String: [String]] {
        return [Constants.CATEGORY_PERSON: self.characters ?? [], Constants.CATEGORY_PLANET: self.planets ?? [], Constants.CATEGORY_STARSHIP: self.starships ?? [], Constants.CATEGORY_VEHICLE: self.vehicles ?? [], Constants.CATEGORY_SPECIES: self.species ?? []]
    }
    
}
