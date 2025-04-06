//
//  WordButttonsView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct WordButttonsView: View {
    
    var wordButtonClicked : (String) -> Void
    var currentWord: String
    var completeWordSet: [String]
    var wordsFound: [String]
    
    var wordButtons = ["backspace","submit"]
    
    var body: some View {
        
        HStack{
            
            ForEach(wordButtons.indices, id: \.self) { index in
                
                let isDisabled = (wordButtons[index] == "backspace" && currentWord.count == 0)||(wordButtons[index] == "submit" && !(completeWordSet.contains(currentWord) && !(wordsFound.contains(currentWord))))
                
                
                Button(action: {wordButtonClicked(wordButtons[index])}, label: {
                    Text(wordButtons[index])
                        .font(.system(size: 30, weight: .bold))
                        .bold()
                        .padding(4)
                        .foregroundStyle(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.blue)
                        )
                }).disabled(isDisabled)
                
                if (index != wordButtons.count - 1) {
                    Spacer()
                }
            }
            
        }.padding()
        
        
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
