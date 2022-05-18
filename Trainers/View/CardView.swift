//
//  CardView.swift
//  Trainers
//
//  Created by Daniel Millward on 14/05/2022.
//

import SwiftUI


struct CardView : View {
    var shoe: String
    @State public var offset = CGSize.zero
    @State private var colour: Color = .gray
   
    @Binding var viewModel:ShoeViewModel
    @Binding var count: Int
    
    @State private var expandedView = false
    
    //@State private var shoe: [String] = ["Jordan", "Nike", "Adidas", "Fila"].reversed()
    
    
    var body: some View{
        HStack{
            ZStack{
                
                Rectangle()
                    .frame(height: 500)
                    //.border(.white, width: 3.0)
                    .cornerRadius(20)
                    .foregroundColor(colour.opacity(0.9))
                    .shadow(radius: 2)
                    .onTapGesture {
                        expandedView.toggle()
                    }
                
                    .sheet(isPresented: $expandedView, content: {
                        expandView(viewModel: $viewModel)
                        
                    })
                
                
                VStack{
                    
                    AsyncImage(url: URL(string:  viewModel.image)
                               //AsyncImage(url: URL(string: viewModel.shoeInfo[0].image.original)
                               , content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame( maxHeight: 250)
                            //.border(.gray, width: 3)
                            .onTapGesture {
                                expandedView.toggle()
                            }
                        
                    },
                               placeholder: {
                        ProgressView()
                        
                    })
                    VStack{
                    HStack{
                        Text(viewModel.brand)
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        Image(systemName: "poweron")
                            .font(.title)
                            .foregroundColor(.white)
                        Text(viewModel.releaseYear)
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                    }.onTapGesture {
                        expandedView.toggle()
                    }
                        Text(viewModel.name)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    }
                   
                    HStack
                    {
                        Button {
                            //next card
                            
                         
                        } label: {
                            Image(systemName: "trash.fill")
                        }
                        .buttonStyle(GrowingButton())
                        .font(.title)
                        
                        Spacer().frame(width: 150)
                        Button {
                            //next card
                         
                        } label: {
                            Image(systemName: "heart.fill")
                        }
                        .font(.title)
                        .buttonStyle(GrowingButton())
                        
                    }.aspectRatio(contentMode: .fit)
                    //  Spacer()
                }
                
                
                
                
                
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
    }
    

    
    func arrayTest() {
        // print("Test: ", viewModel.shoeInfo[count].name)
        print("Test: ", viewModel.shoeInfo[count].name)
        count += 1
        print("COunt is ",count)
    }
    
    struct GrowingButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.yellow)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    struct expandView : View
    {
        @Binding var viewModel:ShoeViewModel
        var body: some View{
        ExpandedView(viewModel: $viewModel)
        }
    }
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            offset = CGSize(width: -500, height: 0)
            arrayTest()
            print("\(shoe) removed")
            // print(viewModel.shoeImages[shoeCount])
            
            
        case 150...500:
            offset = CGSize(width: 500, height: 0)
            arrayTest()
            print("\(shoe) added")
            
        default:
            offset = .zero
        }
        
        
        //shoeCount += 1
    }
    
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            colour = .red
        case 130...500:
            colour = .green
        default:
            colour = .black
        }
    }
}







