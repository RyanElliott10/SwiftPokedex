//
//  Service.swift
//  Pokedex
//
//  Created by Ryan Elliott on 2/18/19.
//  Copyright © 2019 Ryan Elliott. All rights reserved.
//

import Foundation

class Service {
    
    // MARK: - Properties
    
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    // Mark: - Functions
    
    func fetchPokemon(completion: @escaping ([Pokemon]) -> ()) {
        var pokemonArray = [Pokemon]()
        
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle error
            if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
                print(resultArray)
                
                for (key, result) in resultArray.enumerated() {
                    if let dictionary = result as? [String: AnyObject] {
                        let pokemon = Pokemon(id: key, dictionary: dictionary)
                        pokemonArray.append(pokemon)
                    }
                    
                    completion(pokemonArray)
                }
            } catch let error {
                print("Failed to create JSON with error: ", error.localizedDescription)
            }
        }.resume()
        
    }
}
