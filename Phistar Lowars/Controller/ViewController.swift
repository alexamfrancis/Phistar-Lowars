//
//  ViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let searchVC = SearchResultsTableViewController()
        let navVC = UINavigationController(rootViewController: searchVC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchButton.titleLabel?.textAlignment = .center
        self.searchButton.layer.cornerRadius = Constants.CORNER_RADIUS
    }

}
