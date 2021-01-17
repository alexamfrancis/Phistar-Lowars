//
//  Collection.swift
//  Phistar Lowars
//
//  Created by Alexandra Francis on 1/15/21.
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
