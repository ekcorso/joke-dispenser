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
    let buttonView = UIView()

    override func loadView() {
        super.loadView()
        
        self.navigationItem.title = "Select Joke Type"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //VC general set-up
        view.backgroundColor = .black
        
        establishSubviews()
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
        //Set up button for single-part jokes
        singleJokeButton.setTitle("See one-liners", for: .normal)
        view.addSubview(singleJokeButton)
        singleJokeButton.translatesAutoresizingMaskIntoConstraints = false
        singleJokeButton.backgroundColor = .blue
        singleJokeButton.setTitleColor(.white, for: .normal)
        singleJokeButton.layer.cornerRadius = 10
        //singleJokeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        singleJokeButton.addTarget(self, action: #selector(didTapSingleJokeButton), for: .touchUpInside)
        
        //Set up button for two-part jokes
        twoPartJokeButton.setTitle("See two-part jokes", for: .normal)
        view.addSubview(twoPartJokeButton)
        twoPartJokeButton.translatesAutoresizingMaskIntoConstraints = false
        twoPartJokeButton.backgroundColor = .red
        twoPartJokeButton.setTitleColor(.white, for: .normal)
        twoPartJokeButton.layer.cornerRadius = 10
        //twoPartJokeButton.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        twoPartJokeButton.addTarget(self, action: #selector(didTapTwoPartJokeButton), for: .touchUpInside)
        
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        
        buttonView.addSubview(singleJokeButton)
        buttonView.addSubview(twoPartJokeButton)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            buttonView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0),
            buttonView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0),
            buttonView.widthAnchor.constraint(equalToConstant: 100),
            buttonView.heightAnchor.constraint(equalToConstant: 200),
            
            singleJokeButton.topAnchor.constraint(equalTo: buttonView.topAnchor),
            //singleJokeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            //singleJokeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            singleJokeButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            singleJokeButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            singleJokeButton.widthAnchor.constraint(equalToConstant: 200),
            singleJokeButton.heightAnchor.constraint(equalToConstant: 50),
            
            twoPartJokeButton.topAnchor.constraint(equalTo: singleJokeButton.bottomAnchor, constant: 30),
            twoPartJokeButton.leadingAnchor.constraint(equalTo: singleJokeButton.leadingAnchor),
            twoPartJokeButton.trailingAnchor.constraint(equalTo: singleJokeButton.trailingAnchor),
            twoPartJokeButton.heightAnchor.constraint(equalTo: singleJokeButton.heightAnchor),
        ])
    }
}

//Set buttonview to fit AROUND the two buttons (with spacing) and create the buttons with frames. Then center buttonview in the main view
