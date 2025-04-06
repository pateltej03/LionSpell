//
//  Square.swift
//  LionSpell 1
//
//  Created by Tej Patel on 17/09/24.
//

import Foundation
import SwiftUI

struct Hexagon : Shape {
    func path(in rect: CGRect)-> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = min(width, height) / 2
        
        let angle = 2 * CGFloat.pi / 6
        
        for i in 0..<6 {
            let x = center.x + radius * cos(CGFloat(i) * angle - CGFloat.pi / 3)
            let y = center.y + radius * sin(CGFloat(i) * angle - CGFloat.pi / 3)
            let point = CGPoint(x: x, y: y)
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    Hexagon()
}


