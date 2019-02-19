//
//  PokedexController.swift
//  Pokedex
//
//  Created by Ryan Elliott on 2/18/19.
//  Copyright © 2019 Ryan Elliott. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PokedexCell"

class PokedexController: UICollectionViewController {
    
    // MARK: - Properties
    
    var pokemon = [Pokemon]()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponents()
        fetchPokemon()
    }
    
    // MARK: - API
    
    func fetchPokemon() {
        // This is the form of a completion block. pokemon is returned once it finished, therefore we set
        // self.pokemon equal to the returned value
        Service.shared.fetchPokemon { (pokemon) in
            DispatchQueue.main.sync {
                self.pokemon = pokemon
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Selectors
    
    @objc func showSearchBar() {
        print(123)
    }
    
    // MARK: - Helper functions
    
    func configureViewComponents() {
        collectionView.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .mainPink()
        navigationController?.navigationBar.barStyle = .black  // Gives us white text on status bar
        navigationController?.navigationBar.isTranslucent = false
        
        navigationItem.title = "Pokedex"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // Register the CollectionViewCell we made, PokedexCell
        collectionView.register(PokedexCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension PokedexController {
    
    // Creating the cells for the main controller. Determines the amount to render
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokedexCell
        cell.backgroundColor = .blue
        return cell
    }
}

extension PokedexController: UICollectionViewDelegateFlowLayout {
    
    // Setting the margins of the cell collection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Let each cell be a square with the following width (and height, since it's a square)
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
    }
}
