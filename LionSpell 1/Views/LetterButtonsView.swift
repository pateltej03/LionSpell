//
//  LetterButtonsView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import SwiftUI

struct LetterButtonsView: View {
    
    @Environment(GameManager.self) var manager
    var letterClicked : (String) -> Void
    var letters = ["L","E","T","T","E","R","S"]
    var LetterCount: Int
    
    var body: some View {
        ZStack{
            Spacer()
            ForEach(letters.indices, id: \.self) { index in
                
                let indexInt = Int(index)
                let LetterCount = letters.count
                let angle = (LetterCount == 7 ? 30 : LetterCount == 6 ? 54 : 0) + CGFloat(indexInt) * (360 / CGFloat(LetterCount - 1 ))
                
                let radius: CGFloat = 100
                let x = indexInt == 0 ? (cos(angle * .pi / 180) * radius - ((LetterCount == 7 ? 87 : LetterCount == 6 ? 59 : 100))) : cos(angle * .pi / 180) * radius
                let y = indexInt == 0 ? (cos(angle * .pi / 180) * radius - ((LetterCount == 7 ? 85 : LetterCount == 6 ? 60 : 100))) : sin(angle * .pi / 180) * radius
                
                if LetterCount == 7 {
                    Button(action: {letterClicked(letters[index])}, label: {
                        Text(letters[index])
                            .font(.system(size: 45, weight: .bold))
                            .bold()
                            .padding(4)
                            .foregroundStyle(Color.white)
                            .background(
                                Hexagon()
                                    .frame(width: 100, height: 100)
                                
                            )
                        
                    })
                    .position(CGPoint(x: x + radius + 77, y: y + radius + 50))
                }
                
                if LetterCount == 6 {
                    Button(action: {letterClicked(letters[index])}, label: {
                        Text(letters[index])
                            .font(.system(size: 45, weight: .bold))
                            .bold()
                            .padding(4)
                            .foregroundStyle(Color.white)
                            .background(
                                Pentagon()
                                    .frame(width: 100, height: 100)
                                
                            )
                        
                    })
                    .position(CGPoint(x: x + radius + 77, y: y + radius + 50))
                }
                
                if LetterCount == 5 {
                    Button(action: {letterClicked(letters[index])}, label: {
                        Text(letters[index])
                            .font(.system(size: 45, weight: .bold))
                            .bold()
                            .padding(4)
                            .foregroundStyle(Color.white)
                            .background(
                                Square()
                                    .frame(width: 80, height: 80)
                                
                            )
                        
                    })
                    .position(CGPoint(x: x + radius + 77, y: y + radius + 50))
                }
                
                if (index != letters.count - 1) {
                    Spacer()
                }
                Spacer()
            }
            
        }.padding(20)
        
        
    }
}

#Preview {
    AppView()
        .environment(GameManager())
}
