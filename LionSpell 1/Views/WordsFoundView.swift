//
//  WordsFoundView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct WordsFoundView: View {
    var wordsFound: [String] = ["Sample", "Words", "Found", "Sample", "Words", "Found", "Sample", "Words", "Found"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack{
                Spacer()
                ForEach(wordsFound.indices, id: \.self) { index in
                    
                    Text(wordsFound[index])
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }.background(Color.blue.opacity(0.5))
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
