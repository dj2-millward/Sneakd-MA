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


    
    //@State private var shoe: [String] = ["Jordan", "Nike", "Adidas", "Fila"].reversed()

    
    var body: some View{
        ZStack {
            Rectangle()
                .frame(width: 320, height: 420)
                .border(.white, width: 3.0)
                .cornerRadius(8)
                .foregroundColor(colour.opacity(0.9))
                .shadow(radius: 4)
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
}

