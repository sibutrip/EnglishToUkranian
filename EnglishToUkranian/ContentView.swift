//
//  ContentView.swift
//  UkranianToEnglish
//
//  Created by Cory Tripathy on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    let translationService = TranslationService()
    @State var words = ["Test"]
    @State var wordToAdd = String()
    var body: some View {
        VStack {
            TextField("New word", text: $wordToAdd)
                .onSubmit {
                    words.append(wordToAdd)
                }
                .textFieldStyle(.roundedBorder)
            ForEach(words, id: \.self) { word in
                Button(word) {
                    translationService.speak("test")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
