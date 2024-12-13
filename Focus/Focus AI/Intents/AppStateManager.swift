//
//  AppStateManager.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 12/12/24.
//

import Foundation

class AppStateManager{
    static let shared = AppStateManager()
    
    private let key = "currentAppState"
    
    var currentState: AppState {
        get {
            // Hozirgi holatni o‘qish
            if let stateString = UserDefaults.standard.string(forKey: key),
               let state = AppState(rawValue: stateString) {
                return state
            }
            return .focusAIActivate
        }
        set {
            // Yangi holatni saqlang
            UserDefaults.standard.set(newValue.rawValue, forKey: key)
        }
    }
}
