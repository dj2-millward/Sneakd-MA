//
//  ShoeInfo.swift
//  Trainers
//
//  Created by Daniel Millward on 13/05/2022.
//

import Foundation
import SwiftUI

public struct ShoeInfo
{
    let name: String
    let brand: String
    let releaseYear: String
    let retailPrice: Int
    let estimatedMarketValue: Int
    let story: String
    
    
    init(response: Trainers) {
        self.name = response.results.first!.name
        self.brand = response.results.first!.brand
        self.releaseYear = response.results.first!.releaseYear
        self.retailPrice = response.results.first!.retailPrice
        self.estimatedMarketValue = response.results.first!.estimatedMarketValue
        self.story = response.results.first!.story
        }
}
