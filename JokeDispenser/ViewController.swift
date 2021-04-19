//
//  ViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var jokes = [Joke]()
    var joke: Joke?
    var jokeType: String = "twopart"
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleJokeType))
            
            //UIBarButtonItem(barButtonSystemItem: .action , target: self, action: #selector(toggleJokeType))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var urlString: String
        let urlBaseString = "https://v2.jokeapi.dev/joke/Any?safe-mode"
        let twoPartJokeUrlString = urlBaseString + "&type=twopart&amount=10"
        let singlePartJokeUrlString = urlBaseString + "&type=single&amount=10"
        
        joke?.type == "single" ? (urlString = singlePartJokeUrlString) : (urlString = twoPartJokeUrlString)
    
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            parse(json: data)
            return
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
    
        if jokeType == "twopart" {
            if let jsonJokes = try? decoder.decode(TwoPartJokeResult.self, from: json) {
                jokes = jsonJokes.jokes
                tableView.reloadData()
            }
        } else {
            if let jsonJokes = try? decoder.decode(SinglePartJokesResult.self, from: json) {
                jokes = jsonJokes.jokes
                tableView.reloadData()
            }
        }
        //rename json to jsonData for clarity
    }
    
    @objc func toggleJokeType() {
        //toggle between two URLstrings, joke variables, and jokeLabel.text (which var this is set to)
        //Maybe also truncate text in cellLabel.text in cellForRowAt for single-part jokes (to make it make more sense that they need to be tapped to see more)
        
        if joke?.type == "twopart" {
            joke?.type = "single"
        } else {
            joke?.type = "twopart"
        }
        
        tableView.reloadData()
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        if let joke = joke as? TwoPartJoke {
            cell.textLabel?.text = joke.setup
        } else if let joke = joke as? SinglePartJoke {
            cell.textLabel?.text = joke.joke
        }
        
        //Joke is a generic protocol-- when "joke" actaully gets created it isn't a Joke, it's a SinglePartJoke or a TwoPartJoke, but Xcode doesn't know which it will be at this point, so it can't autofill variables
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.joke = jokes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// Write two funcs: fetchOnePartJokes and fetchTwoPartJokes. Each is responsible for making the api request, getting and decoding the result data to provide the array of relevant joke objects. Make a class called something like jokeApi.swift to own those funcs. this vc would have a reference to the jokeApi class. Requires closure or delegate to handle the data.
