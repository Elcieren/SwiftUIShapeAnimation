//
//  Circular.swift
//  SwiftUIShapeAnimation
//
//  Created by Eren Elçi on 6.11.2024.
//

import SwiftUI

struct Circular: View {
    let lineWidth : CGFloat
    let backgorundColor : Color
    let foregroundColor : Color
    let percentage : Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                CircularShape().stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgorundColor)
                CircularShape(percent: percentage).stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }.animation(.easeInOut(duration: 1.0), value: percentage)
            .padding(lineWidth / 1.5)
            
        }
        
        
    }
}

#Preview {
    Circular(lineWidth: 10, backgorundColor: .blue, foregroundColor: .green, percentage: 75)
}
