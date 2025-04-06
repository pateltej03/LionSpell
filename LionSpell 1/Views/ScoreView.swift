//
//  ScoreView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI


struct ScoreView: View {
    var score = 0
    
    var body: some View {
        
        Text(String(score)).font(.system(size: 80, weight: .bold))
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
