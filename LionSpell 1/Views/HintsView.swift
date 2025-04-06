//
//  HintsView.swift
//  LionSpell 1
//
//  Created by Tej Patel on 16/09/24.
//

import SwiftUI

struct HintsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(GameManager.self) var manager
    
    
    
    var body: some View {
        Form {
            Section("Summary") {
                
                Menu {
                    ForEach(manager.summary.allPossibleWords.indices) { index in
                        Text(manager.summary.allPossibleWords[index])
                    }
                }
            label: {HStack {
                Text("Total Number Of Words: \(manager.summary.allPossibleWords.count)")
                Spacer()
                Text(">")
                    .foregroundColor(.blue)
            }}
                Text("Total Points Possible: \(manager.summary.totalPossiblePoints)")
                
                Menu {
                    ForEach(manager.summary.allPossiblePangrams.indices) { index in
                        Text(manager.summary.allPossiblePangrams[index])
                    }
                }
            label: {HStack {
                Text("Number Of Pangrams: \(manager.summary.allPossiblePangrams.count)")
                Spacer()
                Text(">")
                    .foregroundColor(.blue)
            }}
                
                
            }
            
            ForEach(Array(manager.summary.firstLetterList.keys.sorted()), id: \.self){ key in
                Section("Words Of Length \(key)") {
                    let charStrArr = manager.summary.firstLetterList[key] ?? [:]
                    
                    ForEach(Array(charStrArr.keys), id: \.self){ charKey in
                        let words = charStrArr[charKey] ?? []
                        Menu {
                            ForEach(words.indices) { index in
                                Text(words[index])
                            }
                        }
                    label: {HStack {
                        Text("\(charKey): \(words.count)")
                        Spacer()
                        Text(">")
                            .foregroundColor(.blue)
                    }}
                    }
                    
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
