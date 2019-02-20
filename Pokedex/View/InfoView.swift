//
//  InfoView.swift
//  Pokedex
//
//  Created by Ryan Elliott on 2/19/19.
//  Copyright © 2019 Ryan Elliott. All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    // MARK: - Properties
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var nameContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainPink()
        view.addSubview(nameLabel)
        view.layer.cornerRadius = 5
        nameLabel.center(inView: view)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Type: "
        return label
    }()
    
    let defenseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Defense: "
        return label
    }()
    
    let heightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Height: "
        return label
    }()
    
    let pokedexIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Id: "
        return label
    }()
    
    let attackLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Attack: "
        return label
    }()
    
    let weightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainPink()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Weight: "
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainPink()
        button.setTitle("View More Info ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleViewMoreInfo), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleViewMoreInfo(sender: UIButton) {
        
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        backgroundColor = .white
        self.layer.masksToBounds = true
        
        configureImageAndLabels()
    }
    
    func configureImageAndLabels() {
        
        addSubview(nameContainerView)
        nameContainerView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        addSubview(imageView)
        imageView.anchor(top: nameContainerView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 60)
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(typeLabel)
        typeLabel.anchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(defenseLabel)
        defenseLabel.anchor(top: imageView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .groupTableViewBackground
        addSubview(separatorView)
        separatorView.anchor(top: typeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 4, paddingBottom: 0, paddingRight: 4, width: 0, height: 1)
        
        addSubview(heightLabel)
        heightLabel.anchor(top: separatorView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(weightLabel)
        weightLabel.anchor(top: heightLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(pokedexIdLabel)
        pokedexIdLabel.anchor(top: separatorView.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(attackLabel)
        attackLabel.anchor(top: pokedexIdLabel.bottomAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
        
        addSubview(infoButton)
        infoButton.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 50)
    }
}
