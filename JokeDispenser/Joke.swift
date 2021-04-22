//
//  Joke.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import Foundation

protocol Joke: Codable {
    var category: String { get set }
    var type: String { get set }
}

struct TwoPartJoke: Joke {
    var category: String
    var type: String
    
    var setup: String
    var delivery: String
}

struct SinglePartJoke: Joke {
    var category: String
    var type: String
    
    var joke: String
}
