//
//  API.swift
//  Cocktail
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation
import UIKit

public final class API : NSObject
{
    private var completionHandler:((ShoeInfo) -> Void)?
    
    
    func searchShoe(Search name: String, _ completionHandler: @escaping((ShoeInfo) -> Void)){
        
        self.completionHandler = completionHandler
        
        getData(Search: name)
    }
    
    func getData(Search name: String){
        
        let headers = [
            "X-RapidAPI-Host": "the-sneaker-database.p.rapidapi.com",
            "X-RapidAPI-Key": "dfde0b52cbmshd4263db8ca5ca2ap167c02jsn93257125b16e"
        ]
        
        
        let url = URL(string: "https://the-sneaker-database.p.rapidapi.com/search?limit=10&query=\(name)")
        guard url != nil else {
            
            print ("Error creating URL object")
            
            return
            
            
        }
        //URL Request
        
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval:  10)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            
            if error == nil && data != nil {
                
                let response = try! JSONDecoder().decode(Trainers.self, from: data!) 
                
                //self.completionHandler?(Trainers(response : response))
                
                self!.completionHandler?(ShoeInfo(response: response))
                
            }
        }
        
        dataTask.resume()
    }
    
    
    
}



public struct Trainers: Decodable{
    
    let results: [info]
}
public struct info: Decodable
{
    let brand: String
    let name: String
    let releaseYear: String
    let retailPrice: Int
    let estimatedMarketValue: Int
    let story: String
    let image: image
    let links: links
}

public struct image: Decodable
{
    let original: String
}

public struct links: Decodable
{
    let goat: String
    
}

