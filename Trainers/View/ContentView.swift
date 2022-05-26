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
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 50, alignment: .center)
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
                ZStack(alignment: .top){
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
            
            ZStack(alignment: .bottom){
                BotttomBar(selected: self.$selected)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
                
                
                Button(action:{
                }) {
                    Image(systemName: "crown.fill").renderingMode(.original).padding(16)
                }.background(.yellow)
                    .clipShape(Circle())
                    .offset(y: -35)
                    .foregroundColor(.black)
                    .shadow(radius: 3)
                
                
                // CurvedShape()
            }
        }.background(.white).edgesIgnoringSafeArea(.top)
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
    @State private var showingSheet = false;
    @State private var showingSettings = false;
    var body: some View{
        
        ZStack(alignment: .top){
            HStack{
                
                //            Button(action:{
                //                self.selected = 0
                //            }) {
                //                Image(systemName: "house.fill")
                //            }.foregroundColor(self.selected == 0 ? .yellow: .gray)
                //            //Spacer(minLength: 12)
                //
                //                Image(systemName: "arrow.clockwise")
                //                .onTapGesture {
                //                    showingSheet.toggle()
                //                }
                //
                //
                //                .sheet(isPresented: $showingSheet){
                //                    CollectionsView()
                //                }
                //            }.foregroundColor(self.selected == 1 ? .yellow: .gray)
                //            Spacer().frame(width: 120)
                //
                //            Button(action:{
                //                self.selected = 2
                //            }){
                //                Image(systemName: "magnifyingglass")
                //            }.foregroundColor(self.selected == 2 ? .yellow: .gray)
                //            Spacer(minLength: 12)
                //            Button(action:{
                //                self.selected = 3
                //            }){
                //                Image(systemName: "gearshape.fill")
                //            }.foregroundColor(self.selected == 3 ? .yellow: .gray)
                //                .onTapGesture {
                //                //    Settings(viewModel: $viewModel)
                //                }
                //Spacer().frame(width: 120)
                
                Image(systemName: "house.fill")
                    .font(.title2)
                
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(y:+8)
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                Spacer(minLength: 12)
                
                    .sheet(isPresented: $showingSheet){
                        CollectionsView()
                    }
                
                Image(systemName: "arrow.clockwise")
                    .font(.title2)
                
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(y:+8)
                
                Spacer().frame(width: 120)
                
                    .sheet(isPresented: $showingSheet){
                        CollectionsView()
                    }
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(y:+8)
                
                
                Spacer(minLength: 12)
                    .sheet(isPresented: $showingSheet){
                        CollectionsView()
                        
                    }
                Image(systemName: "gearshape.fill")
                    .font(.title2)
                
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .offset(y:+8)
                    .onTapGesture {
                        showingSettings.toggle()
                    }
                
                
                    .sheet(isPresented: $showingSettings){
                        SettingView()
                    }
                
            }
            
            
            
        }}
    
    
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



struct CollectionsView: View {
    @State private var colour: Color = .gray
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack(alignment: .topLeading){
            
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(20)
            })
            
            
            ScrollView{
                VStack{
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }//.aspectRatio(contentMode: .fit)
                    
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }
                    
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }
                    HStack{
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                        
                        
                        Rectangle()
                            .frame(height: 250)
                        //.border(.white, width: 3.0)
                            .cornerRadius(20)
                            .foregroundColor(colour.opacity(0.9))
                            .shadow(radius: 2)
                    }
                }.padding(.top, 80)
            }}
        
    }
}

struct SettingView: View {
    @State private var colour: Color = .gray
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        ZStack(alignment: .topLeading){
            
            Color.white
            //.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(20)
            })
            
            
            
            
            
            NavigationView{
                Form
                {
                    Section(header: Text("Display")){
                        Toggle(isOn: .constant(false),
                               label: {
                            Text("Dark Mode")
                        })
                        
                        
                        Section(header: Text("Display"),
                                footer: Text("System setting will overide and use the current theme of the device")){
                            Toggle(isOn: .constant(true),
                                   label: {
                                Text("Use System Preference")
                            })
                            
                        }
                        
                        Section(header: Text("Shoes")){
                            Toggle(isOn: .constant(true),
                                   label: {
                                Text("All Genders")
                            })
                            
                        }
                    }
                    
                    
                    .navigationTitle("Settings")
                }
                
            }
        }
    }}












