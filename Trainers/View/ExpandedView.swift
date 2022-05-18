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
                    .foregroundColor(.black)
                    .bold()
                
                
                
                HStack{
                    HStack{
                        HStack{
                            Image(systemName: "sterlingsign.circle")
                                .foregroundColor(.black)
                                .font(.title2)
                            
                            if(viewModel.retailPrice != 0)                               {
                            Text("Retail- £" + "\(Int(viewModel.retailPrice))")
                                .font(.title2)
                                .foregroundColor(.black)
                                
                            
                            
                            }else{
                                Text("Retail- £" + "N/A")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                        }
                        Image(systemName: "poweron")
                            .font(.title2)
                            .foregroundColor(.black)
                        HStack{
                            
                            Image(systemName: "sterlingsign.circle.fill")
                                .foregroundColor(.black)
                                .font(.title2)
                            
                            if(viewModel.estimatedMarketValue != 0){
                            Text("Est.~ £" + "\(Int(viewModel.estimatedMarketValue))")
                                .font(.title2)
                                .foregroundColor(.black)
                            
                            }else{
                                Text("Est~ £" + "N/A")
                                    .font(.title2)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                }
                ScrollView{
                Text(viewModel.story)
                    .font(.body)
                    .foregroundColor(.white)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding()
                }
                Spacer()
                
                HStack{
                    HStack(){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .offset(x: -15)
                                .buttonStyle(CardView.GrowingButton())
                        })
                        
                            
                        if(!viewModel.links.isEmpty){
                        Link(destination: URL(string: viewModel.links)!) {
                            
                            Image(systemName: "cart.fill").renderingMode(.original).padding(18)
                                .foregroundColor(.white)
                                .background(.black)
                                .font(.title)
                                .clipShape(Circle())
                                .padding()
                                .offset(y: -35)                        .buttonStyle(CardView.GrowingButton())

                            
                        }
                        }
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .offset(x: 15)
                                .buttonStyle(CardView.GrowingButton())
                        })
                        
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }
        }.onAppear(perform: viewModel.refresh)
        
    }
    
    func isObjectNotNil(object:AnyObject!) -> Bool
    {
        if let _:AnyObject = object
        {
            return true
        }

        return false
    }
}

