//
//  ContentView.swift
//  UkranianToEnglish
//
//  Created by Cory Tripathy on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    let translationService = TranslationService()
    @State @Saving var words: [TranslatedWord]
    @State var wordToAdd = String()
    var body: some View {
        List {
            ForEach(words) { word in
                Button {
                    Task {
                        try await translationService.speak(word.ukranian)
                    }
                } label: {
                    HStack {
                        Text(word.english)
                        Spacer()
                        VStack {
                            Text(word.ukranian)
                            if let latinizedWord = word.latinizedUkranian {
                                Text(latinizedWord)
                                    .foregroundStyle(Color.secondary)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
            TextField("New word", text: $wordToAdd)
                .onSubmit {
                    Task {
                        let ukranianWord = try await translationService.translate(wordToAdd)
                        await MainActor.run {
                            words.append(TranslatedWord(english: wordToAdd, ukranian: ukranianWord))
                        }
                        wordToAdd.removeAll()
                    }
                }
        }
        .onAppear {
            Task {
                try await translationService.assignTranslationModel()
            }
            Task {
                try await translationService.translate("test")
            }
        }
    }
    init() {
        _words = .init(wrappedValue: .init())
    }
}

#Preview {
    ContentView()
}
