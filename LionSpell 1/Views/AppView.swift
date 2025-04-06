//
//  AppView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 02/09/24.
//

import SwiftUI

enum Showing : String, Identifiable, CaseIterable {
    case hints, preferences
    var id: RawValue { rawValue}
}

struct AppView: View {
    @Environment(GameManager.self) var manager
    @State var showing : Showing?
    
    
    var body: some View {
        @Bindable var manager = manager
        ZStack{
            Color.gray
            VStack {
                
                TitleView(title: "Lion Spell")
                Spacer()
                ScoreView(score: manager.score)
                Spacer()
                WordsFoundView(wordsFound: manager.wordsFound)
                Spacer()
                CurrentWordView(currentWord: manager.currentWord)
                LetterButtonsView(letterClicked:{letter in manager.letterClick(letter: letter)}, letters: manager.letters, LetterCount: manager.game.letters.count)
                Spacer()
                WordButttonsView(wordButtonClicked:{buttonType in manager.wordButtonClick(buttonType: buttonType)}, currentWord: manager.currentWord, completeWordSet: manager.game.completeWordSet, wordsFound: manager.wordsFound)
                Spacer()
                GameButtonsView(showing: $showing)
                
                
                
                
            }
            .sheet(item: $showing, content: {item in
                switch item {
                case .hints : HintsView()
                case .preferences : PreferencesView(preferences: $manager.preferences)
                }
            })
            
        }.background(Color.gray)
    }
}


#Preview {
    AppView()
        .environment(GameManager())
}
