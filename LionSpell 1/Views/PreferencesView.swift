//
//  PreferencesView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 16/09/24.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var preferences : Preferences
    @Environment(\.dismiss) var dismiss
    @Environment(GameManager.self) var manager
    
    var body: some View {
        Form {
            Section("Number Of Letters") {
                Picker("Choose Count", selection: $preferences.numberOfLetters) {
                    ForEach(LetterCount.allCases) {
                        
                        Text($0.rawValue.capitalized)
                            .tag($0)
                    }
                }.pickerStyle(.segmented)
                    .onChange(of: preferences.numberOfLetters) {
                        manager.newGame(count: preferences.numberOfLetters, language: preferences.LanguageSet)
                    }
                
            }
            Section("Language") {
                Picker("Choose Language", selection: $preferences.LanguageSet) {
                    ForEach(LanguageChoice.allCases) {
                        
                        Text($0.rawValue.capitalized)
                            .tag($0)
                    }
                }.pickerStyle(.segmented)
                    .onChange(of: preferences.LanguageSet) {
                        manager.newGame(count: preferences.numberOfLetters, language: preferences.LanguageSet)
                    }
                
            }
            Button("Dismiss") {
                dismiss()
            }
        }
        
    }
}
#Preview {
    AppView()
        .environment(GameManager())
}
