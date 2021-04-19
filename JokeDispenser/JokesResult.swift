//
//  JokesResult.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/12/21.
//

import Foundation

protocol JokesResult {
}

struct SinglePartJokesResult: Codable, JokesResult {
    var jokes = [SinglePartJoke]()
}

struct TwoPartJokeResult: Codable, JokesResult {
    var jokes = [TwoPartJoke]()
}

//Can consolidate this file with Joke.swift

//Made this into two separate structs instead of one because for some reason "var jokes = [Joke]()" didn't conform to Codable (has something to do with Joke being a protocol)
