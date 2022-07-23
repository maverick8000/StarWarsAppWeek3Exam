//
//  PokemonTableViewCell.swift
//  Pokedex1
//
//  Created by Raul Barranco on 7/17/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let reuseId = "\(CharacterTableViewCell.self)"
    
    lazy var pokemonImageVIew: UIImageView = {

        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPink
        imageView.image = UIImage(named: "pokeball")
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    lazy var characterNameLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon name"
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.backgroundColor = .black
        label.textColor = .white
        return label
        
    }()
    
    lazy var characterEyeColorLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon type"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        return label
        
    }()
    
    lazy var characterHairColorLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon type"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        return label
        
    }()
    
    lazy var characterHomeworldLabel: UILabel = {
        
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Pokemon type"
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.backgroundColor = .systemIndigo
        label.textColor = .white
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStack = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        vStack.addArrangedSubview(self.characterNameLabel)
        vStack.addArrangedSubview(self.characterEyeColorLabel)
        vStack.addArrangedSubview(self.characterHairColorLabel)
        vStack.addArrangedSubview(self.characterHomeworldLabel)
        
        hStack.addArrangedSubview(self.pokemonImageVIew)
        hStack.addArrangedSubview(vStack)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
        
    }
    
    func configure(name: String) {
        self.characterNameLabel.text = name
    }

    func configure(eyeColor: String) {
        self.characterEyeColorLabel.text = eyeColor
    }
    
    func configure(hairColor: String) {
        self.characterHairColorLabel.text = hairColor
    }
    
    func configure(homeworld: String) {
        self.characterHomeworldLabel.text = homeworld
    }
    
}
