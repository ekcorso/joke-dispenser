//
//  ViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    var jokes = [Joke]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://v2.jokeapi.dev/joke/Any?safe-mode&type=single&amount=10"
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        cell.textLabel?.text = joke.joke

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailViewController()
//        vc.detailItem = petitions[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
//    }

}

