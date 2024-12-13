//
//  AppIntentActivatior.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 13/12/24.
//


import AppIntents
import UIKit

struct AppIntentActivatior: AppIntent {
    static var title: LocalizedStringResource = "Focus AI Activator"

    @Parameter(title: "AppIntentActivatior")

    var data: DataManager?

    
    @MainActor
    func perform() async throws -> some IntentResult {
        SELECTED_APP = data 

        Task {
            do {
                try await AppStateHandlerFunc()
            } catch {
                print("Intentni bajarishda xato: \(error.localizedDescription)")
            }
        }

        
        return .result()
    }

    static var parameterSummary: some ParameterSummary { Summary("Tanlangan Ilova -> \(\.$data)") }
    
    static var openAppWhenRun: Bool = false 
    
}
