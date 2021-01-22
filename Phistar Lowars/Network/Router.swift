//
//  Router.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import Foundation

enum Router {

    case getFilms
    case getPeople
    case getPlanets
    case getSpecies
    case getStarships
    case getVehicles
    
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
        }
    }

    var method: String {
        return "GET"
    }
}
