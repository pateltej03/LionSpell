//
//  Square.swift
//  LionSpell 1
//
//  Created by Tej Patel on 17/09/24.
//

import Foundation
import SwiftUI

struct Square : Shape {
    func path(in rect: CGRect)-> Path {
        var path = Path()
        
        
        let size = min(rect.size.width, rect.size.height)
        let offset = (rect.size.width - size) / 2
        path.addRect(CGRect(x: offset, y: offset, width: size, height: size))
        return path
    }
}

#Preview {
    Square()
}


