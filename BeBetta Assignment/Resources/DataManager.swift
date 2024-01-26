//
//  DataManager.swift
//  BeBetta Assignment
//
//  Created by suhail on 26/01/24.
//

import Foundation

struct DataManager{
    static let shared = DataManager()
    init(){}
    func readJSONFile(completion: ( ([TeamsModel]) -> (Void) )){
        let fileName = "MockData"
        let fileType = "json"
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType) else{
            print("Could not fetch file path")
            return
        }
        
        do{
            let data = try Data(contentsOf: URL(filePath: path))
    
            if let parsedData = parseJSON(unparsedData: data){
                completion(parsedData)
            }
            
        }catch{
            
        }
    }

    func parseJSON(unparsedData: Data)->[TeamsModel]?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode([TeamsModel].self, from: unparsedData)
           
            return decodedData
        }catch{
            print("Error parsing data: \(error)")
           
            
        }
        return nil
    }
    
    
}
