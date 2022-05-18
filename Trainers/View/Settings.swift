//
//  Settings.swift
//  Trainers
//
//  Created by Daniel Millward on 18/05/2022.
//

import SwiftUI

struct Settings: View {
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
            
        }.onAppear(perform: viewModel.refresh)
    
    }
}

