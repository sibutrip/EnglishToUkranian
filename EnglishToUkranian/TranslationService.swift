//
//  TranslationService.swift
//  UkranianToEnglish
//
//  Created by Cory Tripathy on 1/11/24.
//

import Foundation
import AVFoundation

class TranslationService {
    let synthesizer = AVSpeechSynthesizer()
    
    func speak(_ word: String) {
        let ukraninanWord = translate(word)
        textToSpeech(ukraninanWord)
    }
    
    private func translate(_ word: String) -> String {
        return ""
    }
    
    private func textToSpeech(_ word: String) {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: "hola, como estas")


        // Configure the utterance.
        utterance.rate = 1
        utterance.pitchMultiplier = 1
        utterance.postUtteranceDelay = 1
        utterance.volume = 1


        // Retrieve the British English voice.
        let voice = AVSpeechSynthesisVoice(language: "uk-UA")


        // Assign the voice to the utterance.
        utterance.voice = voice
        synthesizer.speak(utterance)
    }
    
    init() {
        textToSpeech("test")
    }
}
