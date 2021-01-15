//
//  ViewController.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/14/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ServiceLayer.request(router: Router.getFilms) { (result: Result<Collection<Film>, Error>) in
            switch result {
            case .success:
                guard let collection = try? result.get(), let films = collection.results else { return }
                for film in films {
                    print(film.title!)
                }
                
            case .failure:
                print(result)
            }
        }
    }


}

