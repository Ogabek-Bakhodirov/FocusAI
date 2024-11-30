//
//  PauseIntent.swift
//  Focus
//
//  Created by Ogabek Bakhodirov on 27/11/24.
//

import AppIntents
import UIKit


struct PauseIntent {
    static var title: LocalizedStringResource = "Pause Before Entering App"
    
    func perform() async throws -> some IntentResult {
            // Open the app's main view
            if let url = URL(string: "myapp://") {
                await UIApplication.shared.open(url)
            }
            return .result()
    }
}
