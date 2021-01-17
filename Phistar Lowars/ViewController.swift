//
//  ViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let results = NetworkManager.shared.people.filter({ $0.name!.lowercased().contains(searchText.lowercased()) })
        print(results.map({ $0.name }))
    }
    
}
