//
//  LocationMapAnnotationView.swift
//  SwiftuiMapApp
//
//  Created by Eugenia Uvarov on 5/21/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    
    var body: some View {
        
        let accentColor = Color("AccentColor")
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit() 
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-3)
                .padding(.bottom, 40)
        }
        .background(Color.clear)
    }
}

#Preview {
    LocationMapAnnotationView()
}
