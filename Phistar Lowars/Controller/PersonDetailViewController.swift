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
    private var moreInfoData = [Constants.SWCategory: [Detailable]]()
    
    init(person: Person) {
        self.person = person
        super.init(nibName: "PersonDetailViewController", bundle: Bundle.main)
        self.populateMoreInfoDate()
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
        let detailInfoVC = MoreInfoTableViewController()
        detailInfoVC.detailData = self.moreInfoData
        detailInfoVC.detailObject = self.person
        self.navigationController?.pushViewController(detailInfoVC, animated: true)
    }

    private func populateMoreInfoDate() {
        let moreInfo = self.person.getMoreInfo()
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
