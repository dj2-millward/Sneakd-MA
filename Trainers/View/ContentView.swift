//
//  ContentView.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = API()

    var body: some View{
        ForEach(viewModel.getShoe, id: \.self) { shoes in
            Text(shoes.name!)
        }
        .onAppear{
            viewModel.getShoe(shoeName: "Air Jordan 11 Retro 'Cherry'")
        }
    }
}


