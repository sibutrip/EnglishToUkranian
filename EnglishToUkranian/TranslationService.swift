//
//  TranslationService.swift
//  EnglishToUkranian
//
//  Created by Cory Tripathy on 1/11/24.
//

import Foundation
import AVFoundation
import MLKitTranslate

actor TranslationService: ObservableObject {
    enum TranslationServiceError: Error {
        case translatorNotLoaded
    }
    private var translator: Translator?
    private let synthesizer = AVSpeechSynthesizer()
    
    public func translate(_ word: String) async throws -> String {
        guard let translator else { throw TranslationServiceError.translatorNotLoaded }
        return try await translator.translate(word)
    }
    
    public func speak(_ word: String) async throws {
        textToSpeech(word)
        print(word)
    }
    
    private func textToSpeech(_ word: String) {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: word)


        // Configure the utterance.
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 1


        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice(language: "uk-UA")


        // Assign the voice to the utterance.
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    
    public func assignTranslationModel() async throws {
        let translationOptions = TranslatorOptions(sourceLanguage: .english, targetLanguage: .ukrainian)
        translator = Translator.translator(options: translationOptions)
        try await translator?.downloadModelIfNeeded()
    }
}
