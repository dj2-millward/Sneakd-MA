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
            AsyncImage(url: URL(string: viewModel.image), content: { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
                    // .frame(maxWidth: 500, maxHeight: 200)
            },
            placeholder: {
                ProgressView()
            })
           
            Text(viewModel.name)
                .padding()
            Text(viewModel.brand)
                .padding()
            Text(viewModel.releaseYear)
                .padding()
      
            HStack{
                Text("Retail Price: £"+"\(Int(viewModel.retailPrice))")
                    .padding()
                Text("Estimated Value: ~£"+"\(Int(viewModel.estimatedMarketValue))")
                    .padding()
            }
            Text(viewModel.story)
                .padding()
          
            
        }.onAppear(perform: viewModel.refresh)
    }
    
}
//   struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView(viewModel: ShoeViewModel(_APIService: API()))
//        }
//}



