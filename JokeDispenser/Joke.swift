//
//  Joke.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import Foundation

struct Joke: Codable {
    var category: String
    var type: String
    
    //Variables for the twoPart joke type
    var setup: String
    var delivery: String
    
    //If using "single" type jokes
    //var joke: String
}

// try doing this with structs using protocols (var category/ type). Then two structs that conform to joke.
// Create a base url and give two different paths/ endpoints. This means they may each need a different result object

