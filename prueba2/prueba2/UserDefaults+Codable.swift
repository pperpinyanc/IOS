//
//  UserDefaults+Codable.swift
//  prueba2
//
//  Created by Pablo Perpinan on 1/3/24.
//

import Foundation

extension UserDefaults {
    
    func save(data: Codable, key: String) -> Bool{
        let encoder = JSONEncoder()
        
        if let encoded: Data = try? encoder.encode(data){
            self.set(encoded, forKey: key)
            return true
        }
        return false
        
    }
    
    func read<T:Codable>(_ t: T.Type, key : String) -> T?
    {
        
        if let data = self.object(forKey: key) as? Data{
            let decoder = JSONDecoder()
            if let dataObj = try? decoder.decode(t, from: data){
                return dataObj
            }
              
        }
        
        return nil
    }
}
