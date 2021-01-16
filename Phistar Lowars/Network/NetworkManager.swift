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
    
    var personURLDictionary = [String: Person]()
    var filmURLDictionary = [String: Film]()
    var planetURLDictionary = [String: Planet]()
    var speciesURLDictionary = [String: Species]()
    var starshipURLDictionary = [String: Starship]()
    var vehicleURLDictionary = [String: Vehicle]()

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
                for person in people {
                    self.personURLDictionary[person.url!] = person
                }
                print("PEOPLE \(self.people.map({ $0.name }))")
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
                for film in films {
                    self.filmURLDictionary[film.url!] = film
                }
                print("FILMS \(self.films.map({ $0.title }))")
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
                for planet in planets {
                    self.planetURLDictionary[planet.url!] = planet
                }
                print("PLANETS \(self.planets.map({ $0.name }))")
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
                for specie in species {
                    self.speciesURLDictionary[specie.url!] = specie
                }
                print("SPECIES \(self.species.map({ $0.name }))")
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
                for starship in starships {
                    self.starshipURLDictionary[starship.url!] = starship
                }
                print("STARSHIPS \(self.starships.map({ $0.name }))")
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
                for vehicle in vehicles {
                    self.vehicleURLDictionary[vehicle.url!] = vehicle
                }
                print("VEHICLES \(self.vehicles.map({ $0.name }))")
            case .failure:
                print(result)
            }
        }
    }
    
}
