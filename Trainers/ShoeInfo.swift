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
    let image: String
    var shoesImages: [String] = []
    var shoeID : [[String]] = [[]]
    var results: [String] = []
    
    
    init(response: Trainers) {
        
       
        self.name = response.results.first!.name
        results.append(self.name)
        
        self.brand = response.results.first!.brand
        results.append(self.brand)
        
        self.releaseYear = response.results.first!.releaseYear
        results.append(self.releaseYear)
        
        self.retailPrice = response.results.first!.retailPrice
        results.append("\(Int(self.retailPrice))")
        
        self.estimatedMarketValue = response.results.first!.estimatedMarketValue
        results.append("\(Int(self.estimatedMarketValue))")
        
        self.story = response.results.first!.story
        results.append(self.story)
        
        self.image = response.results.first!.image.original
        results.append(self.image)
        
        shoeID.append(results)
        
//        for index in 0...response.ShoeID.first!.results.count-1
//               {
//                   self.shoesImages.append(response.ShoeID.first!.results[index].first!.image.original)
//                   self.shoeID.append(results)
//               }
       
        print("ShoeID count: " , shoeID.count)
        print("Results count: " , response.results.count)
        
//        for index in 0...response.ShoeID.first!.results.count-1
//        {
//            self.shoesImages.append(response.ShoeID.first!.results[index].first!.image.original)
//            self.shoeID.append(results)
//        }
//
//        print("Element count: " , response.ShoeID.count)
//        for index in 0...response.shoeID-1        {
//            self.shoesImages.append(response.results[index].image.original)

        
       
    }
}
