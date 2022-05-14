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
      
    public let _APIService: API
    
    public init(_APIService: API) {
        self._APIService = _APIService
    }
    
    public func refresh() {
        _APIService.searchShoe(Search: "Jordan%20CP3.XI%20'Dallas%20Cowboys'") { shoe in DispatchQueue.main.async {
            self.name = shoe.name
            self.brand = shoe.brand
            self.releaseYear = shoe.releaseYear
            self.retailPrice = shoe.retailPrice
            self.estimatedMarketValue = shoe.estimatedMarketValue
            self.story = shoe.story
            self.image = shoe.image
           
        }}
    }
}



