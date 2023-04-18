//
//  JSONParser.swift
//  
//
//  Created by Shengyuan Lu on 4/10/23.
//

import Foundation

class JSONParser<T: Decodable> {
    
    static func readLocalFile(forFileName name: String, forType type: String) -> Data? {
        
        do {
            
            if let filePath = Bundle.main.path(forResource: name, ofType: type) {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                
                // print(fileUrl)
                
                return data
            }
            
            
        } catch let err {
            print("Error: Reading Local File Failed: \(err) !")
        }
        
        print("Warning: readLocalFile data is null")
        
        return nil
    }
    
    
    static func parse(forFileName name: String, forType type: String) -> [T] {
        
        let decoder = JSONDecoder()
        
        if let data = JSONParser.readLocalFile(forFileName: name, forType: type) {
            
            do {
                
                let colleges = try decoder.decode([T].self, from: data)
                
                return colleges
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription) !")
            }
            
        }
        
        print("Warning: parse empty array returned")
        
        return [T]()
    }
}
