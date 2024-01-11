//
//  Saving.swift
//  EnglishToUkranian
//
//  Created by Cory Tripathy on 1/11/24.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Saving<T: Hashable>: DynamicProperty where T: Codable {
    var projectedValue: [T] = .init()
    var wrappedValue: [T] {
        get {
            return projectedValue
        }
        set {
            self.projectedValue = newValue
            DirectoryService.writeModelToDisk(projectedValue)
        }
    }
    init() {
        self.projectedValue = (try? DirectoryService.readModelFromDisk()) ?? [T]()
    }
}
