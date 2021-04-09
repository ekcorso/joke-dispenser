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
            
//            jokeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            jokeLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
//            jokeLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 8)
            
            reactionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            reactionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            reactionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 8)
            
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let joke = joke, let jokeLabel = jokeLabel {
            jokeLabel.text = joke.delivery
        }
    }

    //jokeLabel is nil when viewDidLoad gets to it. This could be because it's not being accessed correctly from the main viewController-- didSelectRowAt could be failing to correctly initialize the detail view controller in the hierarchy. Or it could be that I'm trying to update it at the wrong point in this view controller's lifecycle.
    //https://developer.apple.com/forums/thread/129341
}

//try the segue if that doesn't work try intializing it (using it's built-in initializer) in ViewDidLoad
