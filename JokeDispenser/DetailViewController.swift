//
//  DetailViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 3/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var jokeLabel: UILabel!
    var joke: Joke?
    
    override func viewDidLoad() {
        if let joke = joke {
            jokeLabel.text = joke.joke
        }
    }

    //jokeLabel is nil when viewDidLoad gets to it. This could be because it's not being accessed correctly from the main viewController-- didSelectRowAt could be failing to correctly initialize the detail view controller in the hierarchy. Or it could be that I'm trying to update it at the wrong point in this view controller's lifecycle.
    
}
