//
//  API.swift
//  Cocktail
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation
import UIKit

public class API : ObservableObject

{
    @Published var getShoe: [Trainers] = []
    
    func getShoe(shoeName : String){
        let headers = [
            "X-RapidAPI-Host": "the-sneaker-database.p.rapidapi.com",
            "X-RapidAPI-Key": "0ca96c3d12msh426f558cb45b490p196c7cjsna2bfd5d80839"
            ]
        
        
        let url = URL(string: "https://the-sneaker-database.p.rapidapi.com/search?limit=10&query=Air%20Jordan%2011%20Retro%20'Cherry'")
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

                do {
                    let response = try! JSONDecoder().decode([Trainers].self, from: data! )
                        DispatchQueue.main.async{
                            self?.getShoe = response
                        }

                    print ("TEST", response)
                    //let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]

                    
                    }}
             
            }
        
        dataTask.resume()
    }
}
