//
//  Character.swift
//  StarWarsApp
//
//  Created by Raul Barranco on 7/22/22.
//

import Foundation

struct Character: Decodable {
    
    let results: [Characters]
    
}

struct Characters: Decodable {
    
    let name: String
    let eye_color: String
    let hair_color: String
    let homeworld: String
    let films: [String]
    
}
