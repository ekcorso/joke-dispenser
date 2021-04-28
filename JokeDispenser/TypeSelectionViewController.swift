//
//  TypeSelectionViewController.swift
//  JokeDispenser
//
//  Created by Emily Corso on 4/22/21.
//

import UIKit

class TypeSelectionViewController: UIViewController {
    
    let singleJokeButton = UIButton()
    let twoPartJokeButton = UIButton()
    
    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Select Joke Type"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //VC general set-up
        view.backgroundColor = .black
        
        //Set up button for single-part jokes
        singleJokeButton.setTitle("See one-liners", for: .normal)
        view.addSubview(singleJokeButton)
        singleJokeButton.translatesAutoresizingMaskIntoConstraints = false
        singleJokeButton.backgroundColor = .blue
        singleJokeButton.setTitleColor(.white, for: .normal)
        //singleJokeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        singleJokeButton.addTarget(self, action: #selector(didTapSingleJokeButton), for: .touchUpInside)
        
        //Set up button for two-part jokes
        twoPartJokeButton.setTitle("See two-part jokes", for: .normal)
        view.addSubview(twoPartJokeButton)
        twoPartJokeButton.translatesAutoresizingMaskIntoConstraints = false
        twoPartJokeButton.backgroundColor = .red
        twoPartJokeButton.setTitleColor(.white, for: .normal)
        //twoPartJokeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        twoPartJokeButton.addTarget(self, action: #selector(didTapTwoPartJokeButton), for: .touchUpInside)
        
        setConstraints()
    }
    
    @objc func didTapSingleJokeButton() {
        //Takes user to the main VC and sets the query type to single part jokes
        let viewController = ViewController()
        viewController.jokeType = "single"
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func didTapTwoPartJokeButton() {
        //Takes user to the main VC and sets the query type to two part jokes
        let viewController = ViewController()
        viewController.jokeType = "twopart"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
extension TypeSelectionViewController {
    func establishSubviews() {
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            singleJokeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            singleJokeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            //singleJokeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            singleJokeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            twoPartJokeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            twoPartJokeButton.leadingAnchor.constraint(equalTo: singleJokeButton.leadingAnchor),
            twoPartJokeButton.trailingAnchor.constraint(equalTo: singleJokeButton.trailingAnchor)
        ])
    }
}
