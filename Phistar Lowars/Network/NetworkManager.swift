//
//  NetworkManager.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/15/21.
//

import Foundation

class NetworkManager {
    
    static var shared = NetworkManager()
    
    var masterURLDictionary = [String: Detailable]()
    
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
    
    func getPersonObject(for url: String, completion: @escaping (Person) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Person { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Person, Error>) in
            switch result {
            case .success:
                guard let person = try? result.get(), let url = person.url else { return }
                self.masterURLDictionary[url] = person
                completion(person)
            case .failure:
                print(result)
            }
        }
    }

    func getFilmObject(for url: String, completion: @escaping (Film) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Film { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Film, Error>) in
            switch result {
            case .success:
                guard let film = try? result.get(), let url = film.url else { return }
                self.masterURLDictionary[url] = film
                completion(film)
            case .failure:
                print(result)
            }
        }
    }

    func getPlanetObject(for url: String, completion: @escaping (Planet) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Planet { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Planet, Error>) in
            switch result {
            case .success:
                guard let planet = try? result.get(), let url = planet.url else { return }
                self.masterURLDictionary[url] = planet
                completion(planet)
            case .failure:
                print(result)
            }
        }
    }
    
    func getSpeciesObject(for url: String, completion: @escaping (Species) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Species { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Species, Error>) in
            switch result {
            case .success:
                guard let species = try? result.get(), let url = species.url else { return }
                self.masterURLDictionary[url] = species
                completion(species)
            case .failure:
                print(result)
            }
        }
    }
    
    func getStarshipObject(for url: String, completion: @escaping (Starship) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Starship { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Starship, Error>) in
            switch result {
            case .success:
                guard let starship = try? result.get(), let url = starship.url else { return }
                self.masterURLDictionary[url] = starship
                completion(starship)
            case .failure:
                print(result)
            }
        }
    }
    
    func getVehicleObject(for url: String, completion: @escaping (Vehicle) -> ()) {
        // returns dictionary with the category: title/name that will be converted into a button on the view to navigate to that item's detail page
        if let object = self.masterURLDictionary[url] as? Vehicle { completion(object) }
        ServiceLayer.request(urlString: url) { (result: Result<Vehicle, Error>) in
            switch result {
            case .success:
                guard let vehicle = try? result.get(), let url = vehicle.url else { return }
                self.masterURLDictionary[url] = vehicle
                completion(vehicle)
            case .failure:
                print(result)
            }
        }
    }

    // MARK: - Helper functions
    
    private func getPeople() {
        ServiceLayer.request(router: Router.getPeople) { (result: Result<Collection<Person>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let people = collection.results else { return }
                self.people = people
                for person in people {
                    guard let url = person.url else { continue }
                    self.masterURLDictionary[url] = person
                }
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
                    guard let url = film.url else { continue }
                    self.masterURLDictionary[url] = film
                }
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
                    guard let url = planet.url else { continue }
                    self.masterURLDictionary[url] = planet
                }
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
                    guard let url = specie.url else { continue }
                    self.masterURLDictionary[url] = specie
                }
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
                    guard let url = starship.url else { continue }
                    self.masterURLDictionary[url] = starship
                }
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
                    guard let url = vehicle.url else { continue }
                    self.masterURLDictionary[url] = vehicle
                }
            case .failure:
                print(result)
            }
        }
    }
    
}
