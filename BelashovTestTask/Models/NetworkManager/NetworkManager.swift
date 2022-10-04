//
//  NetworkManager.swift
//  BelashovTestTask
//
//  Created by Кирилл on 03.10.2022.
//

import Foundation

func readJSON(completion: @escaping (Model) -> Void){
    
    let path = Bundle.main.path(forResource: "Data", ofType: "json")
    
    let jsonData = try? Data(NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe))
    
    if let decodedData = try? JSONDecoder().decode(Model.self, from: jsonData!){
        
        completion(decodedData)
        
    }
}


