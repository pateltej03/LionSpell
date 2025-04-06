//
//  CurrentWordView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct CurrentWordView: View {
    var currentWord = "CurrentWord"
    
    var body: some View {
        
        Text(currentWord)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
