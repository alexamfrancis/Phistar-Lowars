//
//  Router.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/16/21.
//

import Foundation

enum Router {

    case getFilms
    case getPeople
    case getPlanets
    case getSpecies
    case getStarships
    case getVehicles
    case search(category: Constants.SWCategory, text: String)
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "swapi.dev"
    }
    
    var path: String {
        switch self {
        case .getFilms:
            return "/api/films"
        case .getPeople:
            return "/api/people"
        case .getPlanets:
            return "/api/planets"
        case .getSpecies:
            return "/api/species"
        case .getStarships:
            return "/api/starships"
        case .getVehicles:
            return "/api/vehicles"
        case .search(let category, _):
            return "/api/\(category)"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(_, let text):
            return [URLQueryItem(name: "search", value: text)]
        default:
            return []
        }
    }

    var method: String {
        return "GET"
    }
}
