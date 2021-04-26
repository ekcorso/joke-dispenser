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
        //Stuff
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        //Set up button for single-part jokes
        singleJokeButton.setTitle("See one-liners", for: .normal)
        view.addSubview(singleJokeButton)
        singleJokeButton.backgroundColor = .blue
        singleJokeButton.setTitleColor(.white, for: .normal)
        singleJokeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        singleJokeButton.addTarget(self, action: #selector(didTapSinglePartJokeButton), for: .touchUpInside)
        
        //Set up button for two-part jokes
        twoPartJokeButton.setTitle("See two-part jokes", for: .normal)
    
    }
    
    @objc func didTapSinglePartJokeButton() {

    }
}
extension TypeSelectionViewController {
    func establishSubviews() {
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
