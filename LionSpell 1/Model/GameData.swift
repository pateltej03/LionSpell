//
//  GameDate.swift
//  LionSpell 1
//
//  Created by Tej Patel on 09/09/24.
//

import Foundation

struct Game {
    var letters = ["a", "c", "u", "r", "b", "t", "e"]
    var currentWord: String = ""
    var wordsFound: [String] = []
    var completeWordSet = Words.english
    var score: Int = 0
    var isSubmitable: Bool = false
    var allLetters = Array("abcdefghijklmnopqrstuvwxyz")
}

enum LetterCount : String, CaseIterable, Identifiable {
    case five, six, seven
    var id : RawValue {rawValue}
}

enum LanguageChoice : String, CaseIterable, Identifiable {
    case english, french
    var id : RawValue {rawValue}
}

struct Preferences {
    var numberOfLetters: LetterCount = .seven
    var LanguageSet: LanguageChoice = .english
}

struct Summary {
    var allPossibleWords: [String] = []
    var totalPossiblePoints: Int = 0
    var allPossiblePangrams: [String] = []
    var firstLetterList: [Int: [Character: [String]]] = [:]
}
