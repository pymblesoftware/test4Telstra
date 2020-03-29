//
//  DataModelInteractor.swift
//  Telstra Test
//
//  Created by Regan Russell on 28/3/20.
//  Copyright © 2020 Regan Russell. All rights reserved.
//

import UIKit

class DataModelInteractor: NSObject {

    var inDict: [String:Any]?
    var data: [DataModel] = [DataModel]()
    var index: Int = 0
    
    func next() {
        if index < data.count - 1 {
            index += 1
        }
    }
    
    func dataModel() -> DataModel? {
        if index < data.count - 1 {
            return data[index]
        }
        else {
            return nil
        }
        
    }
    
    func fetch(completion: @escaping ((_ data: [DataModel])->Void)) {

        fetchData { ( dict, error ) in
            self.inDict = dict
            let temp = dict?["rows"]
            let arr = temp as! Array<Any>
            
            for curr in arr {
                let currDict = curr as! Dictionary<String,Any>
                print( "currDict ---->> \(currDict) " )
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: curr)
                    let instance = try JSONDecoder().decode(DataModel.self, from: jsonData)
                    self.data.append(instance)
                }
                catch {
                    print(error)
                }
            }
            
            completion(self.data)
        }
    }
    
    func fetchData(completion: @escaping ([String:Any]?,Error?) -> Void ) {
        let url = URL( string:"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                
                let utf8Data = String(decoding: data, as: UTF8.self).data(using: .utf8)
                print( utf8Data )
                
                if let array  = try JSONSerialization.jsonObject(with: utf8Data!, options: .allowFragments ) as? [String:Any] {
                    print( array )
                    completion(array,nil)
                }
            }
            catch {
                print(error)
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
