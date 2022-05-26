//
//  SwiftUIView.swift
//  Trainers
//
//  Created by Darcy Smith on 15/05/2022.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        HStack(){
            
            Image("adidas")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
