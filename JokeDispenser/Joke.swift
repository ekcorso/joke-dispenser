//
//  Joke.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import Foundation


struct Joke: Codable {
    //Variables for the twoPart joke type
    var category: String
    var type: String
    var setup: String
    var delivery: String
    
    //If using "single" type jokes
    //var joke: String
}



