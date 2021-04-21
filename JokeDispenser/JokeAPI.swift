//
//  JokeAPI.swift
//  JokeDispenser
//
//  Created by Emily Corso on 4/19/21.
//

import Foundation

protocol JokeAPIDelegate: class {    
    func apiDidFetchTwoPartJokes(jokes: [Joke])
    func apiDidFetchSinglePartJokes(jokes: [Joke])
}

class JokeAPI {
    weak var delegate: JokeAPIDelegate?
    
    func fetchTwoPartJokes() {
        let urlBaseString = "https://v2.jokeapi.dev/joke/Any?safe-mode"
        let twoPartJokeURLString = urlBaseString + "&type=twopart&amount=10"
        
        if let url = URL(string: twoPartJokeURLString), let data = try? Data(contentsOf: url) {
            parseTwoPartJokes(jsonData: data)
            return
        }
    }
    
    func fetchSinglePartJokes() {
        let urlBaseString = "https://v2.jokeapi.dev/joke/Any?safe-mode"
        let singlePartJokeURLString = urlBaseString + "&type=single&amount=10"
        
        if let url = URL(string: singlePartJokeURLString), let data = try? Data(contentsOf: url) {
            parseSinglePartJokes(jsonData: data)
            return
        }
    }
    
    func parseSinglePartJokes(jsonData: Data) {
        let decoder = JSONDecoder()
        
        if let jsonJokes = try? decoder.decode(SinglePartJokesResult.self, from: jsonData) {
            delegate?.apiDidFetchSinglePartJokes(jokes: jsonJokes.jokes)
        }
    }
    
    func parseTwoPartJokes(jsonData: Data) {
        let decoder = JSONDecoder()
        
        if let jsonJokes = try? decoder.decode(TwoPartJokeResult.self, from: jsonData) {
            delegate?.apiDidFetchTwoPartJokes(jokes: jsonJokes.jokes)
        }
    }
}
