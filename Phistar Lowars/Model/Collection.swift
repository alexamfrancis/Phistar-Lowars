//
//  Collection.swift
//  Phistar Lowars
//
//  Created by Philo's #1 Applicant on 1/16/21.
//

import Foundation


struct Collection <T: Codable>: Codable {
    
    var count: Int?
    var next: String?
    var previous: String?
    var results: [T]?
    
}

protocol Detailable {
    
    var name: String? { get set }
    var url: String? { get set }
    
    func getDetails() -> [String]
    func getMoreInfo() -> [Constants.SWCategory: [String]]
    
}
