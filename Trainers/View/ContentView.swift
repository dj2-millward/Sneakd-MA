//
//  ContentView.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel:ShoeViewModel

    var body: some View{
        VStack {
            Text(viewModel.name)
                .padding()
            Text(viewModel.brand)
                .padding()
            Text(viewModel.releaseYear)
                .padding()
            Text("£"+"\(Int(viewModel.retailPrice))")
                .padding()
            Text("~£"+"\(Int(viewModel.estimatedMarketValue))")
                .padding()
            Text(viewModel.story)
                .padding()
            AsyncImage(url: URL(string: viewModel.image))
                .padding()
        }.onAppear(perform: viewModel.refresh)
    }
    
}
//   struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView(viewModel: ShoeViewModel(_APIService: API()))
//        }
//}



