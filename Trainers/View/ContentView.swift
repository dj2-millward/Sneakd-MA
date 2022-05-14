//
//  ContentView.swift
//  Trainers
//
//  Created by Daniel Millward on 07/05/2022.
//

import Foundation
import SwiftUI


struct ContentView: View
{
       
    @State var viewModel:ShoeViewModel
 
    var results: [String] = []
    
    //@State private var shoe: [String] = ["Jordan", "Nike", "Adidas", "Fila"].reversed()
    
   // private var shoe: [String] = viewModel.shoeImages.reversed()
    
       var body: some View {
           VStack {
               ZStack{
                   ForEach(shoe, id: \.self) { _shoe in
                       CardView(shoe: _shoe, viewModel: $viewModel)
                   }
               }
           }.onAppear(perform: viewModel.refresh)
       }
}
        
        

    




