//
//  GameManager.swift
//  LionSpell 1
//
//  Created by Tej Patel on 03/09/24.
//

import Foundation
import SwiftUI

@Observable
class GameManager {
    var game = Game()
    var summary = Summary()
    
    var letters: [String] {
        return game.letters
    }
    
    var currentWord: String {
        return game.currentWord
    }
    
    var wordsFound: [String] {
        return game.wordsFound
    }
    
    var score: Int {
        return game.score
    }
    
    var isSubmitable: Bool {
        return game.isSubmitable
    }
    
    var preferences: Preferences = Preferences()
    
    func letterClick(letter: String){
        game.currentWord += letter
        if (game.completeWordSet.contains(game.currentWord)){
            game.isSubmitable = true
        }
    }
    
    func wordButtonClick(buttonType: String){
        if (buttonType == "backspace"){
            backspaceClick()
        }
        else if (buttonType == "submit"){
            submitClick()
        }
    }
    
    func backspaceClick(){
        game.currentWord.popLast()
    }
    
    func submitClick(){
        if (game.completeWordSet.contains(game.currentWord)){
            game.wordsFound.append(game.currentWord)
            game.isSubmitable = false
            game.score += score(word: game.currentWord)
            game.currentWord = ""
            
        }
    }
    
    
    func score(word: String)-> Int{
        var singleScore = 0
        
        if(word.count == 4){
            singleScore = singleScore + 1
        }
        else {
            singleScore = singleScore + isPangram(word: word)
        }
        return singleScore
        
    }
    
    func isPangram(word: String)-> Int{
        var pangramScore = 0
        if (word.contains(game.letters[0]) && word.contains(game.letters[1]) && word.contains(game.letters[2]) && word.contains(game.letters[3]) && word.contains(game.letters[4]) ){
            pangramScore = pangramScore + 10
        }
        pangramScore = pangramScore + word.count
        return pangramScore
    }
    
    
    func shuffleLetters (){
        game.letters.shuffle()
    }
    
    func newGame (count: LetterCount, language: LanguageChoice){
        let numberOfLettersString = count.rawValue
        
        let countNumber: Int
        switch numberOfLettersString {
        case "five":
            countNumber = 5
        case "six":
            countNumber = 6
        case "seven":
            countNumber = 7
        default:
            countNumber = 7
        }
        
        let randomLetters = game.allLetters.shuffled().prefix(countNumber)
        game.letters = Array(randomLetters.map { String($0) })
        game.currentWord = ""
        game.wordsFound = []
        game.score = 0
        
        let selectedLanguageSet: [String]
        let languageIn = language.rawValue
        switch languageIn {
        case "englishWords":
            selectedLanguageSet = Words.english
        case "frenchWords":
            selectedLanguageSet = Words.french
        default:
            selectedLanguageSet = Words.english
        }
        
        game.completeWordSet = selectedLanguageSet
        
        resetSummary()
        
        setSummary()
        
    }
    
    func resetSummary () {
        summary.allPossibleWords = []
        summary.totalPossiblePoints = 0
        summary.allPossiblePangrams = []
        summary.firstLetterList = [:]
    }
    
    func setSummary(){
        summary.allPossibleWords = findAllPossibleWords()
        
        var scoringAllWords = 0
        for word in summary.allPossibleWords{
            
            scoringAllWords = scoringAllWords + score(word: word)
            if ((isPangram(word: word) - word.count) == 10){
                summary.allPossiblePangrams.append(word)
            }
        }
        summary.totalPossiblePoints = scoringAllWords
        
        splitByLengthAndChar()
        
    }
    
    func findAllPossibleWords() -> [String] {
        
        let AllWords = Set(game.completeWordSet)
        let Letters = Set(game.letters.flatMap {$0})
        return AllWords.filter{ word in
            let Word = Set(word)
            return Word.isSubset(of: Letters)
        }
    }
    
    func splitByLengthAndChar () {
        var PossibleWords = summary.allPossibleWords
        
        while PossibleWords.count > 0{
            let wordLength = PossibleWords[0].count
            if summary.firstLetterList.keys.contains(wordLength){
                // length exists
                if (summary.firstLetterList[wordLength]?.keys.contains(PossibleWords[0].first ?? " ") ?? false){
                    // first letter exists
                    
                    summary.firstLetterList[wordLength]![PossibleWords[0].first!]!.append(PossibleWords[0])
                    
                }
                else {
                    
                    summary.firstLetterList[wordLength]![PossibleWords[0].first!] = []
                    summary.firstLetterList[wordLength]![PossibleWords[0].first!]!.append(PossibleWords[0])
                    
                }
            }
            else {
                // length does not exist yet
                summary.firstLetterList[wordLength] = [:]
                
                summary.firstLetterList[wordLength]![PossibleWords[0].first!] = []
                summary.firstLetterList[wordLength]![PossibleWords[0].first!]!.append(PossibleWords[0])
                
            }
            PossibleWords.removeFirst()
        }
    }
    
    func doesNothing(){}
    
    
}
