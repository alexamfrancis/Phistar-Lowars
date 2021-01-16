//
//  NetworkManager.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/15/21.
//

import Foundation

class NetworkManager {
    
    static var shared = NetworkManager()
    
    var people = [Person]()
    var films = [Film]()
    var planets = [Planet]()
    var species = [Species]()
    var starships = [Starship]()
    var vehicles = [Vehicle]()
    
    init() {
        self.getPeople()
        self.getFilms()
        self.getSpecies()
        self.getPlanets()
        self.getStarships()
        self.getVehicles()
    }
    
    private func getPeople() {
        ServiceLayer.request(router: Router.getPeople) { (result: Result<Collection<Person>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let people = collection.results else { return }
                self.people = people
            case .failure:
                print(result)
            }
        }
    }
    
    private func getFilms() {
        ServiceLayer.request(router: Router.getFilms) { (result: Result<Collection<Film>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let films = collection.results else { return }
                self.films = films
            case .failure:
                print(result)
            }
        }
    }
    
    private func getPlanets() {
        ServiceLayer.request(router: Router.getPlanets) { (result: Result<Collection<Planet>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let planets = collection.results else { return }
                self.planets = planets
            case .failure:
                print(result)
            }
        }
    }
    
    private func getSpecies() {
        ServiceLayer.request(router: Router.getSpecies) { (result: Result<Collection<Species>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let species = collection.results else { return }
                self.species = species
            case .failure:
                print(result)
            }
        }
    }
    
    private func getStarships() {
        ServiceLayer.request(router: Router.getStarships) { (result: Result<Collection<Starship>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let starships = collection.results else { return }
                self.starships = starships
            case .failure:
                print(result)
            }
        }
    }
    
    private func getVehicles() {
        ServiceLayer.request(router: Router.getVehicles) { (result: Result<Collection<Vehicle>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let vehicles = collection.results else { return }
                self.vehicles = vehicles
            case .failure:
                print(result)
            }
        }
    }
    
}
