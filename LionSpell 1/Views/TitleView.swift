//
//  TitleView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct TitleView: View {
    var title = "Game Title to be Added"
    
    var body: some View {
        Text(title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}

