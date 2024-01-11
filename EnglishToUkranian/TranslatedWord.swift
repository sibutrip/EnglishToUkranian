//
//  TranslatedWord.swift
//  EnglishToUkranian
//
//  Created by Cory Tripathy on 1/11/24.
//

import Foundation

struct TranslatedWord: Identifiable, Hashable, Codable {
    var id: UUID
    let english: String
    let ukranian: String
    var latinizedUkranian: String? {
        return NSString(string: ukranian)
            .applyingTransform(StringTransform.toLatin, reverse: false)
    }
    
    init(english: String, ukranian: String) {
        self.id = UUID()
        self.english = english
        self.ukranian = ukranian
    }
}
