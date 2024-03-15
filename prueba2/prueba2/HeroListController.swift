//
//  PokemonVC.swift
//  prueba2
//
//  Created by Pablo Perpinan on 15/3/24.
//

import Foundation
import UIKit




class HeroListController: ViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        RepoManager.Marvel.getHeroes(offset: 1, limit: 20) { heroes in
            let i = 0
            
        }
        
    }
}
