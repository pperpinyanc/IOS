//
//  +Heroes.swift
//  prueba2
//
//  Created by Pablo Perpinan on 15/3/24.
//

import Foundation

extension MarvelApiRepository {
    
    func getHeroes(offset: Int = 0, limit: Int = 20, onSucces: @escaping MarvelRepository.HeroesResponse) {
        
        let marvelComponents = MarvelURLComponents()
        
        marvelComponents
            .AddToPath(.Characters)
            .addOffset(offset)
            .addLimit(limit)
        
        if let url = marvelComponents.Components?.url//Cambiar
        {
          //  URLSession.getData(HeroesResponse.Type, url:url) { response in
                
                
           // } on Failure:  error in
            
            
        }
    }
    
}
