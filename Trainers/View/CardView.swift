//
//  CardView.swift
//  Trainers
//
//  Created by Daniel Millward on 14/05/2022.
//

import SwiftUI


struct CardView : View {
    var shoe: String
    @State private var offset = CGSize.zero
    @State private var colour: Color = .gray
    @Binding var viewModel:ShoeViewModel
    @State private var shoeCount: Int = 0
    
    
    @State private var expandedView = false
    
    //@State private var shoe: [String] = ["Jordan", "Nike", "Adidas", "Fila"].reversed()
    
    
    var body: some View{
        ZStack {
            
            Rectangle()
                .frame(height: 420)
                
                .border(.white, width: 3.0)
                .cornerRadius(8)
                .foregroundColor(colour.opacity(0.9))
                .shadow(radius: 4)
                .onTapGesture {
                    expandedView.toggle()
                }
            
        
            .sheet(isPresented: $expandedView, content: {
                expandView(viewModel: $viewModel)
                
            })
            Spacer()
           
            
            
            
            
            VStack{
                
                AsyncImage(url: URL(string: viewModel.image), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500, maxHeight: 300)
                },
                           placeholder: {
                    ProgressView()
                })
                
                HStack{
                    Text(viewModel.brand)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(viewModel.releaseYear)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                }
                Text(viewModel.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                  
                    .padding()
                Spacer()
            }
            .onAppear{print(viewModel.image)}
        }.onAppear(perform: viewModel.refresh)
        
            .offset(x: offset.width, y: offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(DragGesture()
                        .onChanged { gesture in
                offset = gesture.translation
                withAnimation {
                    changeColor(width: offset.width)
                }
            }
                        .onEnded { _ in
                withAnimation {
                    swipeCard(width: offset.width)
                    changeColor(width: offset.width)
                }
            }
            )
        
          
          
    }
    
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            print("\(shoe) removed")
            // print(viewModel.shoeImages[shoeCount])
            
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            print("\(shoe) added")
        default:
            offset = .zero
        }
        
        shoeCount += 1
    }
    
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            colour = .red
        case 130...500:
            colour = .yellow
        default:
            colour = .black
        }
    }
    
    struct expandView : View
    {
        @Binding var viewModel:ShoeViewModel
        @Environment(\.presentationMode) var presentationMode
        var body: some View {
            ZStack(alignment: .topLeading){
                
                Color.red
                    .edgesIgnoringSafeArea(.all)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(20)
                    })
                
                
                VStack{
                    
                    AsyncImage(url: URL(string: viewModel.image), content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 500, maxHeight: 200)
                    },
                               placeholder: {
                        ProgressView()
                    })
                    
                    HStack{
                        Text(viewModel.brand)
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        Text(viewModel.releaseYear)
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                    }
                    Text(viewModel.name)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    Text(viewModel.story)
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                    
                }
            }
            
        }
    }
}




        
       
