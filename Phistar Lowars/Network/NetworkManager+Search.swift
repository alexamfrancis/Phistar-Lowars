//
//  NetworkManager+Search.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/27/21.
//

import Foundation

extension NetworkManager {
    
    func search(for text: String, completion: @escaping ((Bool) -> ())) {
        let dispatchGroup = DispatchGroup()
        var successAll: Bool = true
        dispatchGroup.enter()
        NetworkManager.shared.searchPeople(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.shared.searchPlanets(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.shared.searchFilms(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.shared.searchSpecies(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.shared.searchStarships(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        NetworkManager.shared.searchVehicles(for: text) { success in
            successAll = success
            dispatchGroup.leave()
        }
        
        dispatchGroup.wait()
        
        completion(successAll)
    }
    
    func searchPeople(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .people, text: text)) { (result: Result<Collection<Person>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let people = collection.results else { return }
                self.people = people
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
    func searchPlanets(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .planets, text: text)) { (result: Result<Collection<Planet>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let planets = collection.results else { return }
                self.planets = planets
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
    func searchFilms(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .films, text: text)) { (result: Result<Collection<Film>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let films = collection.results else { return }
                self.films = films
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
    func searchSpecies(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .species, text: text)) { (result: Result<Collection<Species>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let species = collection.results else { return }
                self.species = species
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
    func searchStarships(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .starships, text: text)) { (result: Result<Collection<Starship>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let starships = collection.results else { return }
                self.starships = starships
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
    func searchVehicles(for text: String, completion: @escaping ((Bool) -> ())) {
        ServiceLayer.request(router: Router.search(category: .vehicles, text: text)) { (result: Result<Collection<Vehicle>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let vehicles = collection.results else { return }
                self.vehicles = vehicles
                completion(true)
            case .failure:
                print(result)
                completion(false)
            }
        }
    }
    
}
