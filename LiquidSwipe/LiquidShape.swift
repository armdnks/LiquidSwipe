//
//  LiquidShape.swift
//  LiquidSwipe
//
//  Created by armdnks on 12/5/21.
//

import SwiftUI

struct LiquidShape: Shape {
    
    var offset : CGSize
    
    var animatableData: CGSize.AnimatableData {
        get { return offset.animatableData }
        set { offset.animatableData = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let width = rect.width
            let height = rect.height
            
            let offsetPoint = offset.height * 1.7
            let offsetW = offset.width * 1.2
            let offsetH = offset.height * 0.3
            
            path.move(to: CGPoint(x: 0, y: -50 + offsetH))
            
            path.addCurve(to: CGPoint(x: width, y: offsetH),
                          control1: CGPoint(x: (width / 5)  + offsetW, y: -150 + offsetPoint),
                          control2: CGPoint(x: (width / 10)  + offsetW, y: offsetH))
            
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            
            path.closeSubpath()
            
            
        }
    }
}
