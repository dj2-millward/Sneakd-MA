//
//  ExpandedView.swift
//  Trainers
//
//  Created by Daniel Millward on 18/05/2022.
//

import SwiftUI

struct ExpandedView: View {
    @Binding var viewModel:ShoeViewModel
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Color.yellow
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
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Image(systemName: "poweron")
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    Text(viewModel.releaseYear)
                        .font(.title2)
                        .foregroundColor(.black)
                    
                    
                }
                
                
                Text(viewModel.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                
                
                HStack{
                    HStack{
                        HStack{
                            Image(systemName: "sterlingsign.circle")
                                .foregroundColor(.white)
                                .font(.title2)
                            
                            Text("Retail-£" + "\(Int(viewModel.retailPrice))")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            
                        }
                        Image(systemName: "poweron")
                            .font(.title2)
                            .foregroundColor(.white)
                        HStack{
                            
                            Image(systemName: "sterlingsign.circle.fill")
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("Est.-£" + "\(Int(viewModel.estimatedMarketValue))")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                    
                }
                
                Text(viewModel.story)
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                
                Spacer()
                
                HStack{
                    VStack{
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .buttonStyle(CardView.GrowingButton())
                        })
                        
                        
                        
                        Link(destination: URL(string: viewModel.links)!) {
                            
                            Image(systemName: "cart.fill").renderingMode(.original).padding(18)
                                .buttonStyle(CardView.GrowingButton())
                                .background(.black)
                                .clipShape(Circle())
                                .offset(y: -25)
                                .foregroundColor(.yellow)
                                .shadow(radius: 3)
                            
                            
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .buttonStyle(CardView.GrowingButton())
                        })
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }
        }.onAppear(perform: viewModel.refresh)
        
    }
}

