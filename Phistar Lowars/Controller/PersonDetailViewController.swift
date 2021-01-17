//
//  PersonDetailViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/15/21.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailStackView: UIStackView!
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        super.init(nibName: "PersonDetailViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = self.person.name else { return }
        self.imageView.image = UIImage(named: name)
        self.nameLabel.text = name
        self.imageView.layer.cornerRadius = self.imageView.frame.height / 2
        self.setupDetailStackView()
    }
    
    private func setupDetailStackView() {
        let details = self.person.getDetails()
        for detail in details {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .body)
            label.textAlignment = .center
            label.lineBreakMode = .byWordWrapping
            label.text = detail.capitalized
            label.textColor = Constants.APP_COLOR
            self.detailStackView.addArrangedSubview(label)
        }
        let button = UIButton()
        button.clipsToBounds = false
        button.layer.cornerRadius = Constants.CORNER_RADIUS
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constants.APP_COLOR
        button.setTitle("   More Info...   ", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
        button.addTarget(self, action: #selector(self.moreInfoTapped), for: .touchUpInside)
        self.detailStackView.addArrangedSubview(button)
    }
    
    @objc private func moreInfoTapped() {
        // TODO: make network request for more info show more info view
        print("User tapped more info on person \(self.person.name ?? "")")
        let moreInfo = self.person.getMoreInfo()
        for (key, value) in moreInfo {
            for url in value {
                switch key {
                case Constants.CATEGORY_FILM:
                    NetworkManager.shared.getFilmObject(for: url) { film in
                        print(film.title)
                    }
                case Constants.CATEGORY_PERSON:
                    NetworkManager.shared.getPersonObject(for: url) { person in
                        print(person.name)
                    }
                case Constants.CATEGORY_PLANET:
                    NetworkManager.shared.getPlanetObject(for: url) { planet in
                        print(planet.name)
                    }
                case Constants.CATEGORY_SPECIES:
                    NetworkManager.shared.getSpeciesObject(for: url) { species in
                        print(species.name)
                    }
                case Constants.CATEGORY_STARSHIP:
                    NetworkManager.shared.getStarshipObject(for: url) { starship in
                        print(starship.name)
                    }
                case Constants.CATEGORY_VEHICLE:
                    NetworkManager.shared.getVehicleObject(for: url) { vehicle in
                        print(vehicle.name)
                    }
                default:
                    print("FAILED to find (key: \(key), value \(value))")
                }
                
            }
        }

        print(moreInfo)
    }

}
