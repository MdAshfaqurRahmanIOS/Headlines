//
//  JSONManager.swift
//  Headlines
//
//  Created by Md Ashfaqur Rahman on 17/11/20.
//

import UIKit

protocol WeatherProtocol {
    func showCuntryName(jsonModel: JSONModel)
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
                        
//                        let  viewController = ViewController()
//                        viewController.showCuntryName(temp: finalData)
                        delegate?.showCuntryName(jsonModel: finalData)
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
            let articles = storeDecoder.articles
            var array = [UIImage]()
            for articles in articles {
                
                if let imageUrlString = articles.urlToImage {
                    
                    if let imageURL = URL(string: imageUrlString) {
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: imageURL)
                            if let data = data {
                                let image = UIImage(data: data)
                                DispatchQueue.main.async {
                                    array.append(image!)
                                }
                            }
                        }
                    }
                }
                print(articles.urlToImage ?? "")
            }
            
            
            let jsonModel = JSONModel(articles: articles, image: array)
            return jsonModel
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
    
}
