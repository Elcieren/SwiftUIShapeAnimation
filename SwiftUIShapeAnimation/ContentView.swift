//
//  ContentView.swift
//  SwiftUIShapeAnimation
//
//  Created by Eren Elçi on 6.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstCirclePercentage : Double = 0
    @State var secondCirclePercentage : Double = 0
    @State var threeCirclePercentage : Double = 0
    var body: some View {
        ZStack {
            Circular(lineWidth: 40, backgorundColor: Color.blue.opacity(0.2), foregroundColor: Color.blue, percentage: firstCirclePercentage)
                .frame(width: 350, height:  350)
                .onTapGesture {
                    if self.firstCirclePercentage == 0 {
                        self.firstCirclePercentage = 50
                    } else {
                        self.firstCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgorundColor: Color.red.opacity(0.2), foregroundColor: Color.red, percentage: secondCirclePercentage)
                .frame(width: 250, height:  250)
                .onTapGesture {
                    if self.secondCirclePercentage == 0 {
                        self.secondCirclePercentage = 75
                    } else {
                        self.secondCirclePercentage = 0
                    }
                }
            Circular(lineWidth: 40, backgorundColor: Color.green.opacity(0.2), foregroundColor: Color.green, percentage: threeCirclePercentage)
                .frame(width: 150, height:  150)
                .onTapGesture {
                    if self.threeCirclePercentage == 0 {
                        self.threeCirclePercentage = 100
                    } else {
                        self.threeCirclePercentage = 0
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
