//
//  InIntentTest.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 13/12/24.
//
//

import UIKit
import AppIntents
import Intents

class InIntentTest: INIntent{
    
//    static var title: LocalizedStringResource = "Instagram activated // Instagram"
    
    @MainActor
    func perform() async throws -> some IntentResult {
        // Holatni yangilash

        print("ga qaytilmoqda.")

        return .result()
        
    }
    
    static var openAppWhenRun: Bool = true

    
}
