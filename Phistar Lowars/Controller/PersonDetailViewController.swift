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
    }

}
