//
//  DetailViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    //deleting "weak" below kind of solves the "instance will be immediately deallocated" warning
    @IBOutlet var jokeLabel: UILabel!
    var joke: Joke?
    
    override func loadView() {
        //view = UIView() <--Do I need this?
        jokeLabel = UILabel()
    }
    
    override func viewDidLoad() {
        
        if let joke = joke, let jokeLabel = jokeLabel {
            jokeLabel.text = joke.joke
        }
    }

    //jokeLabel is nil when viewDidLoad gets to it. This could be because it's not being accessed correctly from the main viewController-- didSelectRowAt could be failing to correctly initialize the detail view controller in the hierarchy. Or it could be that I'm trying to update it at the wrong point in this view controller's lifecycle.
    //https://developer.apple.com/forums/thread/129341
}

//try the segue if that doesn't work try intializing it (using it's built-in initializer) in ViewDidLoad
