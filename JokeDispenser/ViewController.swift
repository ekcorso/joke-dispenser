//
//  ViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/11/21.
//

import UIKit

class ViewController: UITableViewController {
    
    //let tableView = UITableView()
    var jokes = [Joke]()
    let jokeAPI = JokeAPI()
    var jokeType: String?
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleJokeType))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        //establishSubviews()
        setUpTableView()
        //setConstraints()
        
        jokeAPI.delegate = self
        if jokeType == "twopart" {
            jokeAPI.fetchTwoPartJokes()
        } else if jokeType == "single" {
            jokeAPI.fetchSinglePartJokes()
        }
    }
        
    func setUpTableView() {
        //tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let joke = jokes[indexPath.row]
        
        if let joke = joke as? TwoPartJoke {
            cell.textLabel?.text = joke.setup
        } else if let joke = joke as? SinglePartJoke {
            cell.textLabel?.text = joke.joke
        }
        
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
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

extension ViewController {
    func establishSubviews() {
        //view.addSubview(tableView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

