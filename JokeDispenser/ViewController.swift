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
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleJokeType))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var urlString: String
        let urlBaseString = "https://v2.jokeapi.dev/joke/Any?safe-mode"
        let twoPartJokeUrlString = urlBaseString + "&type=twopart&amount=10"
        let singlePartJokeUrlString = urlBaseString + "&type=single&amount=10"
        
        joke?.type == "single" ? (urlString = singlePartJokeUrlString) : (urlString = twoPartJokeUrlString)
        //This always fails because at this point jokes hasn't been populated yet and joke has not been intialized
        
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            parse(jsonData: data)
            return
        }
    }
    
    func parse(jsonData: Data) {
        let decoder = JSONDecoder()
    
//        if jokeType == "twopart" {
//            if let jsonJokes = try? decoder.decode(TwoPartJokeResult.self, from: json) {
//                jokes = jsonJokes.jokes
//                tableView.reloadData()
//            }
//        } else {
//            if let jsonJokes = try? decoder.decode(SinglePartJokesResult.self, from: json) {
//                jokes = jsonJokes.jokes
//                tableView.reloadData()
//            }
//        }
        

        if let jsonJokes = try? decoder.decode(TwoPartJokeResult.self, from: jsonData) {
            jokes = jsonJokes.jokes
            tableView.reloadData()
        } else {
            if let jsonJokes = try? decoder.decode(SinglePartJokesResult.self, from: jsonData) {
                jokes = jsonJokes.jokes
                tableView.reloadData()
            }
        }
    }
    
    @objc func toggleJokeType() {
        //toggle between two URLstrings, joke variables, and jokeLabel.text (which var this is set to)
        //Maybe also truncate text in cellLabel.text in cellForRowAt for single-part jokes (to make it make more sense that they need to be tapped to see more)
        
//        if joke?.type == "twopart" {
//            joke?.type = "single"
//        } else {
//            joke?.type = "twopart"
//        }
        
        jokes[0].type = "single"
        //This changes the joke type (see po jokes[0], but it's after the fact. It doesn't change which data was brought in, only the data it already has (which is meaningless). Perhaps toggle should re-fetch/ parse the json instead
        print("joke type is now \(joke?.type)")
        
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.joke = jokes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// Write two funcs: fetchSinglePartJokes and fetchTwoPartJokes. Each is responsible for making the api request, getting and decoding the result data to provide the array of relevant joke objects. Make a class called something like jokeApi.swift to own those funcs. this vc would have a reference to the jokeApi class. Requires closure or delegate to handle the data.
