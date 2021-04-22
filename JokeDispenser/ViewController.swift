//
//  ViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var jokes = [Joke]()
    let jokeAPI = JokeAPI()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleJokeType))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeAPI.delegate = self
        jokeAPI.fetchTwoPartJokes()
    }
        
    @objc func toggleJokeType() {
        if jokes.first?.type == "twopart" {
            jokeAPI.fetchSinglePartJokes()
        } else {
            jokeAPI.fetchTwoPartJokes()
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.joke = jokes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: JokeAPIDelegate {
    func apiDidFetchTwoPartJokes(jokes: [Joke]) {
        self.jokes = jokes
        tableView.reloadData()
    }
    
    func apiDidFetchSinglePartJokes(jokes: [Joke]) {
        self.jokes = jokes
        tableView.reloadData()
    }
}
