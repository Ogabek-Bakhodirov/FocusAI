//
//  FocusAIActivatorIntent.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 01/12/24.
//


import AppIntents
import UIKit

struct FocusAIActivatorIntent: AppIntent {
    static var title: LocalizedStringResource = "Focus AI Activator"

//    @Parameter(title: "Ilova nomi tanlangan bo'lishi shart!")

//    var data: DataManager?

    
    @MainActor
    func perform() async throws -> some IntentResult {
        
//        SELECTED_APP = data 
        AppStateManager.shared.currentState = .selectedAppActivate
        print("Focus AI faollashdi.")
        print(AppStateManager.shared.currentState)
        
//        Task {
//            do {
//                try await AppStateHandlerFunc()
//            } catch {
//                print("Intentni bajarishda xato: \(error.localizedDescription)")
//            }
//        } // Example function call

        
        return .result()
    }

//    static var parameterSummary: some ParameterSummary { Summary("Tanlangan Ilova -> \(\.$data)") }
    
    static var openAppWhenRun: Bool = true 
    
}
