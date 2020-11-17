//
//  JSONManager.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 17/11/20.
//

import Foundation

protocol WeatherProtocol {
    func showCuntryName(temp: JSONModel)
}

struct JSONManager {
    
    var delegate: WeatherProtocol?
    
    let appConnect = "https://newsapi.org/v2/top-headlines?apiKey=afa5c731eb484b49994b5840c2a84433"
    
    
    func watherFunc (city: String){
        
        let addcityConcat = "\(appConnect)&country=\(city)"
         print(addcityConcat)
        receiveDataFormApi(data1: addcityConcat)
    }
    
    func receiveDataFormApi (data1: String) {
        
        if let url = URL(string: data1) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let collectData = data {
                    
                    //  let convertdata = String(data: collectData, encoding: .utf8)
                    // print(convertdata!)
                    
                    
                    if let finalData = self.reciveDecodinigData(decoding: collectData) {
                        
                        delegate?.showCuntryName(temp: finalData)
                        
//
//                        let  viewController = ViewController()
//                        viewController.showCuntryName(temp: finalData)
                        
                    }
                    
                    
                }
                
            }
            task.resume()
        }
        
    }
    
    func reciveDecodinigData(decoding: Data) -> JSONModel? {
        
        
        let jsonDecoder = JSONDecoder()
        
        do {
            
            let storeDecoder = try jsonDecoder.decode(JSONData.self, from: decoding)
            
            
            let name = storeDecoder.articles[0].author
            print(name ?? "")
            
//            let temp = storeDecoder.main.temp
//            let desc = storeDecoder.weather[0].description
//            let id = storeDecoder.weather[0].id
            
            
            let jsonModel = JSONModel(name: name ?? "")
            
            return jsonModel
            
        } catch {
            print(error)
            return nil
        }
        
        
        
        
    }
    
}
