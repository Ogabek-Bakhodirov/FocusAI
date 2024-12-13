//
//  SelectedAppActivator.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 12/12/24.
//

import UIKit
import AppIntents

struct SelectedAppActivator: AppIntent{
    
    static var title: LocalizedStringResource = "Instagram activated // Instagram"
    
    @MainActor
    func perform() async throws -> some IntentResult {
        // Holatni yangilash
        AppStateManager.shared.currentState = .focusAIActivate

        print("\(SELECTED_APP?.rawValue)ga qaytilmoqda.")
        print(AppStateManager.shared.currentState)


        return .result()
    }
    
    static var openAppWhenRun: Bool = false
}
