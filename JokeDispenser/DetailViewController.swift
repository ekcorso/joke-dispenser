//
//  DetailViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var jokeLabel: UILabel!
    var emojiLabel: UILabel!
    var emojis = ["😂", "🤣", "😆", "😜", "🤪", "🤯", "🧐", "🤓"]
    var joke: Joke?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        jokeLabel = UILabel()
    
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.font = UIFont.systemFont(ofSize: 15)
        jokeLabel.text = "Joke goes here"
        jokeLabel.numberOfLines = 0
        jokeLabel.lineBreakMode = .byWordWrapping
        jokeLabel.textAlignment = .left
        jokeLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        //view.addSubview(jokeLabel)
        
        emojiLabel = UILabel()
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.font = UIFont.systemFont(ofSize: 50)
        emojiLabel.text = emojis.randomElement()
        emojiLabel.numberOfLines = 1
        emojiLabel.textAlignment = .center
        
        let reactionView = UIView()
        reactionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reactionView)
        
        reactionView.addSubview(emojiLabel)
        reactionView.addSubview(jokeLabel)
        
        NSLayoutConstraint.activate([
    
            reactionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            reactionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            reactionView.widthAnchor.constraint(equalToConstant: 100),
            reactionView.heightAnchor.constraint(equalToConstant: 100),
            
            emojiLabel.topAnchor.constraint(equalTo: reactionView.topAnchor, constant: 8),
            emojiLabel.centerXAnchor.constraint(equalTo: reactionView.centerXAnchor, constant: 0),
            
            jokeLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            jokeLabel.centerXAnchor.constraint(equalTo: emojiLabel.centerXAnchor, constant: 0),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let joke = joke as? TwoPartJoke, let jokeLabel = jokeLabel {
            jokeLabel.text = joke.delivery
        } else if let joke = joke as? SinglePartJoke, let jokeLabel = jokeLabel {
            jokeLabel.text = joke.joke
        }
    }
}
