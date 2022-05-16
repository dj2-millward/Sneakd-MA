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
    
    @State public var viewModel:ShoeViewModel
    @State private var count: Int = 0
    var results: [String] = []
    
    @State private var shoe: [String] = ["Jordan", "Nike", "Adidas", "Fila"].reversed()
    @State private var searchText = ""
    // private var shoe: [String] = viewModel.shoeImages.reversed()
    
    var body: some View {
        VStack{
            VStack(spacing: 4){
                
                Image("adidas")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
            }
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.white)
                    
                    TextField("Search", text: $searchText)
                }
                .opacity(0.6)
                .font(.headline)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                                .fill(Color.yellow)
                                .shadow(color: .black, radius: 4, x: 0, y: 0))
                .padding()
            }
            
            VStack {
                ZStack{
                    ForEach(shoe, id: \.self) { _shoe in
                        CardView(shoe: _shoe, viewModel: $viewModel, count: $count)
                    }
                }
            }.onAppear(perform: viewModel.refresh)
            
            
            
            Spacer()
                
            
        }
        .padding(.top, 5)
    }
    
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}










