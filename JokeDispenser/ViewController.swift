//
//  ViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var jokes = [Joke]()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action , target: self, action: #selector(toggleJokeType))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This version returns two-part jokes only
        let urlString = "https://v2.jokeapi.dev/joke/Any?safe-mode&type=twopart&amount=10"
        
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            parse(json: data)
            return
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonJokes = try? decoder.decode(JokesResult.self, from: json) {
            jokes = jsonJokes.jokes
            tableView.reloadData()
        }
    }
    
    @objc func toggleJokeType() {
        //toggle between two URLstrings, joke variables, and jokeLabel.text (which var this is set to)
        //Maybe also truncate text in cellLabel.text in cellForRowAt for single-part jokes (to make it make more sense that they need to be tapped to see more)
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.setup

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.joke = jokes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

