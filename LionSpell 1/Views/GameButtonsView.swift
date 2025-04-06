//
//  GameButtonsView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct GameButtonsView: View {
    @Environment(GameManager.self) var manager
    @Binding var showing : Showing?
    
    var body: some View {
        
        HStack{
            
            Button(action: {manager.shuffleLetters()}, label: {
                Text("shuffle")
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(5)
                    .foregroundStyle(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.blue)
                    )
            })
            Button(action: {manager.newGame(count: manager.preferences.numberOfLetters, language: manager.preferences.LanguageSet)}, label: {
                Text("newGame")
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(5)
                    .foregroundStyle(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.blue)
                    )
            })
            Button(action: {showing = .hints}, label: {
                Text("hint")
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(5)
                    .foregroundStyle(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.blue)
                    )
            })
            Button(action: {showing = .preferences}, label: {
                Text("pref")
                    .font(.system(size: 24, weight: .bold))
                    .bold()
                    .padding(5)
                    .foregroundStyle(Color.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.blue)
                    )
            })
            
        }.padding()
        
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
