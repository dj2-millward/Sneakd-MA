//
//  TrainersApp.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import SwiftUI

@main
struct TrainersApp: App {
    var body: some Scene {
        WindowGroup {
        let _APIService = API()
        let viewModel = ShoeViewModel(_APIService: _APIService)
            ContentView(viewModel: viewModel)
        }
        
    }
}
