//
//  Trainers.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation

public struct Trainers{
    
    let brand: String
    let name: String
//    let silhouette: String
//    let releaseYear: String
//    let retailPrice: Float
//    let estimatedMarketValue: Float
//    let story: String
//    let Image: String
    
    
    init(response: APIResponse) {
        brand = response.brand
        name = response.name
   
    }
}
