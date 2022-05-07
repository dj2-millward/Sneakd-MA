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
    public override init(){
        
        super.init()

        let headers = [
            "X-RapidAPI-Host": "the-sneaker-database.p.rapidapi.com",
            "X-RapidAPI-Key": "0ca96c3d12msh426f558cb45b490p196c7cjsna2bfd5d80839"
        ]
        let url = URL(string: "https://the-sneaker-database.p.rapidapi.com/sneakers?limit=20")
        guard url != nil else {

            print ("Error creating URL object")

            return

        }
        //URL Request

        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval:  10)

        request.httpMethod = "GET"

        request.allHTTPHeaderFields = headers
        
        //Get the URLSession

        let session = URLSession.shared

        //Create the data task

        let dataTask = session.dataTask(with: request) { (data, response, error) in

            //Check for errors

            if error == nil && data != nil {

                //Try to parse out the data
                do {

                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]

                    print ("TEST", dictionary)
                }
                catch {
                    print("Error parsing response data")
                }
            }
        }
        dataTask.resume()
    }
}

struct APIResponse: Decodable {
    let name: String
    let main: APIMain
    let shoe: [APIShoe]
}

struct APIMain: Decodable {
    let temp: Double
}

struct APIShoe: Decodable {
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}


