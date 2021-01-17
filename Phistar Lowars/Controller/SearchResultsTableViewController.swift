//
//  SearchResultsTableViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/15/21.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    enum Categories: Int, CaseIterable {
        case people
        case films
        case planets
        case species
        case starships
        case vehicles
        
        var title: String {
            switch self {
            case .people:
                return "Characters"
            case .films:
                return "Films"
            case .planets:
                return "Planets"
            case .species:
                return "Species"
            case .starships:
                return "Starships"
            case .vehicles:
                return "Vehicles"
            }
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredPeople: [Person] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.people : NetworkManager.shared.people.filter({ $0.name!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    var filteredFilms: [Film] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.films : NetworkManager.shared.films.filter({ $0.title!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    var filteredPlanets: [Planet] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.planets : NetworkManager.shared.planets.filter({ $0.name!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    var filteredSpecies: [Species] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.species : NetworkManager.shared.species.filter({ $0.name!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    var filteredStarships: [Starship] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.starships : NetworkManager.shared.starships.filter({ $0.name!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") || $0.model!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    var filteredVehicles: [Vehicle] {
        return self.searchController.searchBar.text?.isEmpty ?? true ? NetworkManager.shared.vehicles : NetworkManager.shared.vehicles.filter({ $0.name!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") || $0.model!.lowercased().contains(self.searchController.searchBar.text?.lowercased() ?? "") })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Categories.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Categories(rawValue: section) {
        case .people:
            return self.filteredPeople.count
        case .films:
            return self.filteredFilms.count
        case .planets:
            return self.filteredPlanets.count
        case .species:
            return self.filteredSpecies.count
        case .starships:
            return self.filteredStarships.count
        case .vehicles:
            return self.filteredVehicles.count
        case .none:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Categories(rawValue: section)?.title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch Categories(rawValue: indexPath.section) {
        case .people:
            cell.textLabel?.text = self.filteredPeople[indexPath.row].name
        case .films:
            cell.textLabel?.text = self.filteredFilms[indexPath.row].title
        case .planets:
            cell.textLabel?.text = self.filteredPlanets[indexPath.row].name
        case .species:
            cell.textLabel?.text = self.filteredSpecies[indexPath.row].name
        case .starships:
            cell.textLabel?.text = self.filteredStarships[indexPath.row].name
        case .vehicles:
            cell.textLabel?.text = self.filteredVehicles[indexPath.row].name
        case .none:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch Categories(rawValue: indexPath.section) {
        case .films:
            let film = self.filteredFilms[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = film
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        case .people:
            let person = self.filteredPeople[indexPath.row]
            let personVC = PersonDetailViewController(person: person)
            self.navigationController?.pushViewController(personVC, animated: true)
        case .planets:
            let planet = self.filteredPlanets[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = planet
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        case .species:
            let species = self.filteredSpecies[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = species
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        case .starships:
            let starship = self.filteredStarships[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = starship
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        case .vehicles:
            let vehicle = self.filteredVehicles[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = vehicle
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        default:
            print("No search category found for indexPath section \(indexPath.section)")
        }
    }

    // MARK: - Helper functions
    
    private func setupNavigationBar() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search Star Wars"
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = self.searchController
        self.navigationItem.title = "The World of Star Wars"
        self.definesPresentationContext = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.close))
    }
    
    @objc private func close() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

extension SearchResultsTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.tableView.reloadData()
    }
}
