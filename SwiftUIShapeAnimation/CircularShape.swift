//
//  CircularShape.swift
//  SwiftUIShapeAnimation
//
//  Created by Eren Elçi on 6.11.2024.
//

import SwiftUI
import Foundation

struct CircularShape: Shape {
    var percent : Double
    var startAngle : Double
    
    typealias AnimatableData = Double
    var animatableData: Double  {
        get {
            return percent
        }
        
        set {
            percent = newValue
        }
    }
    
    init(percent: Double = 100 , startAngle: Double = -90 ){
        self.percent = percent
        self.startAngle = startAngle
    }
    
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let heigt = rect.height
        let radius = min(width,heigt) / 2
        let center = CGPoint(x: width / 2 , y: heigt / 2)
        let endangle = self.percent / 100 * 360 + self.startAngle
        
        return Path {  path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endangle), clockwise: false)
        }
    }
    
    
}


