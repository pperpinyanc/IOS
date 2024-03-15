//
//  MarvelRepository.swift
//  prueba2
//
//  Created by Pablo Perpinan on 15/3/24.
//

import Foundation


protocol MarvelRepository {
    
    typealias HeroesResponse = ([Hero]) -> ()
    
    
    func getHeroes(offset: Int, limit: Int ,onSucces: @escaping HeroesResponse)
    
    
}
