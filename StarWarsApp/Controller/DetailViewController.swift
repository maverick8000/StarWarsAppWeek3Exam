//
//  DetailViewController.swift
//  StarWarsApp
//
//  Created by Raul Barranco on 7/22/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "name"
        label.backgroundColor = .magenta
        return label
    }()
    
    lazy var eyeColorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "eyeColor"
        label.backgroundColor = .magenta
        return label
    }()
    
    lazy var hairColorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "hairColor"
        label.backgroundColor = .magenta
        //label.layer.cornerRadius = 12
        return label
    }()

    lazy var homeworldLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "homeworld"
        label.backgroundColor = .magenta
        //label.layer.cornerRadius = 12
        return label
    }()
    
    lazy var filmsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "films"
        label.backgroundColor = .magenta
        //label.layer.cornerRadius = 12
        return label
    }()
    
    let text: String
    let eyeColor: String
    let hairColor: String
    let homeworld: String
    let films: [String]
    
    //init(textText: String, eyeColor: String, hairColor: String, homeworld: String) {
    init(textText: String, eyeColor: String, hairColor: String, homeworld: String, films: [String]) {
        
        
        self.text = textText
        //self.nameLabel.text = textText
//        self.imageData = imageData
//        self.typeString = typeString
//        self.abilityStringArr = abilityStringArr
//        self.moveStringArr = moveStringArr
        self.eyeColor = eyeColor
        self.hairColor = hairColor
        self.homeworld = homeworld
        self.films = films
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.nameLabel.text = self.text
        self.eyeColorLabel.text = self.eyeColor
        self.hairColorLabel.text = self.hairColor
        self.homeworldLabel.text = self.homeworld
        
        let stringRepresentation = self.films.joined(separator: ", ")
        self.filmsLabel.text = stringRepresentation
        
        self.setUpUI()
        //self.progLabel.text = self.text

    }
    
    private func setUpUI() {
        
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.eyeColorLabel)
        self.view.addSubview(self.hairColorLabel)
        self.view.addSubview(self.homeworldLabel)
        self.view.addSubview(self.filmsLabel)
        
//        self.nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.nameLabel.heightAnchor.constraint(equalToConstant: 250).isActive = true
//        self.nameLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
//        self.nameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -44).isActive = true
        
        self.nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.nameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        
        self.eyeColorLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.eyeColorLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.eyeColorLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.eyeColorLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 16).isActive = true
        
        self.hairColorLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.hairColorLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.hairColorLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.hairColorLabel.topAnchor.constraint(equalTo: self.eyeColorLabel.bottomAnchor, constant: 16).isActive = true
        
        self.homeworldLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.homeworldLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.homeworldLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.homeworldLabel.topAnchor.constraint(equalTo: self.hairColorLabel.bottomAnchor, constant: 16).isActive = true
        
        self.filmsLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.filmsLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.filmsLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.filmsLabel.topAnchor.constraint(equalTo: self.homeworldLabel.bottomAnchor, constant: 16).isActive = true
        
    }
    



}
