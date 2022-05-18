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
    @State var selected = 0
    var results: [String] = []
    //var shoe: [String] = []
    
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
                ZStack(alignment: .topLeading){
                    ForEach(shoe, id: \.self) { _shoe in
                        CardView(shoe: _shoe, viewModel: $viewModel, count: $count)
                    }
                }
            }.onAppear(perform: viewModel.refresh)
            
            
            
            Spacer()
            
            
        }
        .padding(.top, 5)
        
//        VStack{
//
//            Spacer()
//
//            ZStack{
//                BotttomBar().padding().padding(.horizontal,22).background(CurvedShape())
//            }
//
//        }.background(.gray)
        
        VStack{
            Spacer()
            
            ZStack{
                BotttomBar(selected: self.$selected)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
            
            
            Button(action:{
            }) {
                Image(systemName: "crown.fill").renderingMode(.original).padding(18)
            }.background(.yellow)
            .clipShape(Circle())
            .offset(y: -35)
            .foregroundColor(.black)
            .shadow(radius: 3)
           // CurvedShape()
        }
    }.background(.white)
    }
                       
        

}

struct CurvedShape : View {
    var body: some View{
       
            Path{path in
                path.move(to: CGPoint(x: 0, y:0))
                path.addLine(to: CGPoint(x:UIScreen.main.bounds.width, y: 0))
                path.addLine(to: CGPoint(x:UIScreen.main.bounds.width, y: 100))
                
                path.addArc(center: CGPoint(x:UIScreen.main.bounds.width / 2, y: 100), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
                path.addLine(to:    CGPoint(x: 0, y: 100))
                
                
            }.fill(Color.black)
                .rotationEffect(.init(degrees: 180))
                .padding(.bottom, -40)
                .frame(maxHeight: .infinity, alignment: .bottom)
                

    }
}
    

struct BotttomBar : View {
    @Binding var selected : Int
    var body: some View{
        HStack{
            
            Button(action:{
                self.selected = 0
            }) {
                Image(systemName: "house.fill")
            }.foregroundColor(self.selected == 0 ? .yellow: .gray)
            Spacer(minLength: 12)
            Button(action:{
                self.selected = 1
            }) {
                Image(systemName: "heart.fill")
            }.foregroundColor(self.selected == 1 ? .yellow: .gray)
            Spacer().frame(width: 120)
            
            Button(action:{
                self.selected = 2
            }){
                Image(systemName: "magnifyingglass")
            }.foregroundColor(self.selected == 2 ? .yellow: .gray)
            Spacer(minLength: 12)
            Button(action:{
                self.selected = 3
            }){
                Image(systemName: "gearshape.fill")
            }.foregroundColor(self.selected == 3 ? .yellow: .gray)
            //Spacer().frame(width: 120)
        
        }
            
         
            
            
            
            
//            Button(action:{
//            }){
//                Image(systemName: "heart")
//            }.foregroundColor(.yellow)
//            
//            Spacer(minLength: 12)
//            Button(action:{
//            }){
//                Image(systemName: "magnifyingglass")
//            }.foregroundColor(.yellow)
        }
}
    

        
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}










