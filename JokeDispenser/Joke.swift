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

// try doing this with structs using protocols (var category/ type). Then two structs that conform to joke.
// Create a base url and give two different paths/ endpoints. This means they may each need a different result object

