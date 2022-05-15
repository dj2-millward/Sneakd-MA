//
//  Tracker.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation
import SwiftUI


class ShoeViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var brand: String = ""
    @Published var releaseYear: String = ""
    @Published var retailPrice: Int = 0
    @Published var estimatedMarketValue: Int = 0
    @Published var story: String = ""
    @Published var image: String = ""
    
    @Published var shoeImages: [String] = []
    @Published var shoeInfo: [info] = []

      
    public let _APIService: API
    
    public init(_APIService: API) {
        self._APIService = _APIService
    }
    
    public func refresh() {
        _APIService.searchShoe(Search: "Jordan%201") { shoe in DispatchQueue.main.async {
            self.name = shoe.name
            self.brand = shoe.brand
            self.releaseYear = shoe.releaseYear
            self.retailPrice = shoe.retailPrice
            self.estimatedMarketValue = shoe.estimatedMarketValue
            self.story = shoe.story
            self.image = shoe.image
            
            print("Image updated")
            self.shoeImages = shoe.shoesImages
            self.shoeInfo = shoe.shoeInfo
            print("Shoe info updated")

            
            print("Shoe info array count: ", self.shoeInfo.count)
           
        }}
    }
}



