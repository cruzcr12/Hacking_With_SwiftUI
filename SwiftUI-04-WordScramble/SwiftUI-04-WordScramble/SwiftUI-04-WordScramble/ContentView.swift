//
//  ContentView.swift
//  SwiftUI-04-WordScramble
//
//  Created by Esteban Alonso Cruz Hidalgo on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var userScore = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                    // Do not allow capitalization for the word
                        .autocapitalization(.none)
                }
                Section{
                    ForEach(usedWords, id: \.self) { word in
                        HStack{
                            // This line allows you to show the count of letters of the word in a circle
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                Section {
                    HStack{
                        Text("Your Score")
                            .font(.subheadline.weight(.semibold))
                        Text(String(userScore))
                            .font(.headline.bold())
                    }
                }
                
            }
            .navigationTitle(rootWord)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Restart"){
                        restartGame()
                    }
                }
            }
            // This modifier adds an action to perform when the user submits a value to this view.
            .onSubmit(addNewWord)
            // This modifier performs a function before the view appears
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError){
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord(){
        // Lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else { return }
        
        guard isShortWord(word: answer) else {
            wordError(title: "Word is too short", message: "Use words with no shorter than 3 letters")
            return
        }
        
        guard isStartWord(word: answer) else {
            wordError(title: "Using starting word", message: "Use a different word than the starting word")
            return
        }
        
        guard isOriginal(word: answer) else  {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        
        withAnimation{
            usedWords.insert(answer, at: 0)
            userScore += 1 + answer.count
        }
        newWord = ""
    }
    
    func restartGame(){
        usedWords = [String]()
        startGame()
        newWord = ""
        userScore = 0
    }
    
    func startGame(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            // Load start text into a string
            if let startWords = try? String(contentsOf: startWordsURL){
                // Get all words by spliting starWords
                let allWords = startWords.components(separatedBy: "\n")
                // Get a random word from the array
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        
        // If the start file was not found or cannot be loaded, a fatal error should
        // have happened
        fatalError("Could not load start.txt from bundle")
    }
    
    // Validates the word is not shorter than 3 letters or the start word
    func isShortWord(word: String) -> Bool{
        !(word.count < 3)
    }
    
    func isStartWord(word: String) -> Bool{
        !word.elementsEqual(rootWord)
    }
    
    
    // This function validates if the word has been already used
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    
    // This function validates if the word passed uses all letter available in the rootWord
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        // Every letter in the word was found
        return true
    }
    
    // This function will validates if the word entered is real
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        // If the word is not misspelled, then is a real word
        return misspelledRange.location == NSNotFound
    }
    
    // This will show the alert with the error message passed as parameters
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
