//
//  Film.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/16/21.
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
    var name: String? {
        get {
            return self.title
        }
        set {
            self.title = newValue
        }
    }
    
    
    func getDetails() -> [String] {
        return ["Title: \(self.title ?? "")", "Episode \(self.episodeId ?? 0)", "Opening Crawl: \(self.openingCrawl ?? "")", "Director: \(self.director ?? "")", "Producer: \(self.producer ?? "")", "Release Date: \(self.releaseDate ?? "")"]
    }
    
    func getMoreInfo() -> [Constants.SWCategory: [String]] {
        return [.people: self.characters ?? [], .planets: self.planets ?? [], .starships: self.starships ?? [], .vehicles: self.vehicles ?? [], .species: self.species ?? []]
    }
    
}
