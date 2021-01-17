//
//  StarWarsObjectTableViewController.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/17/21.
//

import UIKit

class StarWarsObjectTableViewController: UITableViewController {

    var starWarsObject: Detailable?
    var objectInfo = [String]()
    var moreInfoData = [Constants.SWCategory: [Detailable]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.objectInfo = self.starWarsObject?.getDetails() ?? []
        self.populateMoreInfoDate()
        self.navigationItem.title = self.starWarsObject?.name
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.moreInfoData.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            // object info section
            return self.objectInfo.count
        }
        let index = self.moreInfoData.index(self.moreInfoData.startIndex, offsetBy: section - 1)
        return self.moreInfoData[index].value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            // object info section
            cell.textLabel?.text = self.objectInfo[indexPath.row]
            cell.isUserInteractionEnabled = false
        } else {
            let index = self.moreInfoData.index(self.moreInfoData.startIndex, offsetBy: indexPath.section - 1)
            cell.textLabel?.text = self.moreInfoData[index].value[indexPath.row].name
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = self.moreInfoData.index(self.moreInfoData.startIndex, offsetBy: indexPath.section - 1)
        if self.moreInfoData.keys[index] == .people, let person = self.moreInfoData[index].value[indexPath.row] as? Person {
            let personVC = PersonDetailViewController(person: person)
            self.navigationController?.pushViewController(personVC, animated: true)
        } else {
            let detailable = self.moreInfoData[index].value[indexPath.row]
            let swObjectVC = StarWarsObjectTableViewController()
            swObjectVC.starWarsObject = detailable
            self.navigationController?.pushViewController(swObjectVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Star Wars Object Details"
        }
        let index = self.moreInfoData.index(self.moreInfoData.startIndex, offsetBy: section - 1)
        let key = self.moreInfoData.keys[index]
        return key.rawValue.capitalized
    }
    
    // MARK: - Helper functions
    
    private func populateMoreInfoDate() {
        guard let moreInfo = self.starWarsObject?.getMoreInfo() else { return }
        for (key, value) in moreInfo {
            self.moreInfoData[key] = [Detailable]()
            for url in value {
                switch key {
                case .films:
                    NetworkManager.shared.getFilmObject(for: url) { film in
                        self.moreInfoData[key]?.append(film)
                    }
                case .people:
                    NetworkManager.shared.getPersonObject(for: url) { person in
                        self.moreInfoData[key]?.append(person)
                    }
                case .planets:
                    NetworkManager.shared.getPlanetObject(for: url) { planet in
                        self.moreInfoData[key]?.append(planet)
                    }
                case .species:
                    NetworkManager.shared.getSpeciesObject(for: url) { species in
                        self.moreInfoData[key]?.append(species)
                    }
                case .starships:
                    NetworkManager.shared.getStarshipObject(for: url) { starship in
                        self.moreInfoData[key]?.append(starship)
                    }
                case .vehicles:
                    NetworkManager.shared.getVehicleObject(for: url) { vehicle in
                        self.moreInfoData[key]?.append(vehicle)
                    }
                }
            }
        }
    }

}
