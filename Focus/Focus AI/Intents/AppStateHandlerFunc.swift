//
//  AppStateHandlerFunc.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 12/12/24.
//

import Foundation
import Intents

@MainActor
func AppStateHandlerFunc() async throws {
    switch AppStateManager.shared.currentState {
    case .focusAIActivate:
//        print("FocusAIActivatorIntent")
//        let activator = FocusAIActivatorIntent()
//        try await activator.perform()
        
        print("Activating FocusAIActivatorIntent")
        let activator = InIntentTest()
        let interaction = INInteraction(intent: activator, response: nil)
        interaction.direction = .outgoing
        

        do {
            try await interaction.donate()
        } catch {
            print("Failed to donate interaction: \(error.localizedDescription)")
        }

    case .selectedAppActivate:
//        print("SelectedAppActivator")
//        let redirector = SelectedAppActivator()
//        try await redirector.perform()
        print("Activating SelectedAppActivator")
//        let redirector = SelectedAppActivator()
//        let interaction = INInteraction(intent: redirector, response: nil)
//
//        do {
//            try interaction.donate()
//        } catch {
//            print("Failed to donate interaction: \(error.localizedDescription)")
//        }
    }
}

//
//@MainActor
//func AppStateHandlerFunc() async throws {
//    switch AppStateManager.shared.currentState {
//    case .focusAIActivate:
//        print("Activating FocusAIActivatorIntent")
//        let activator = FocusAIActivatorIntent()
//        let interaction = INInteraction(intent: activator, response: nil)
//
//        do {
//            try interaction.donate()
//        } catch {
//            print("Failed to donate interaction: \(error.localizedDescription)")
//        }
//
//    case .selectedAppActivate:
//        print("Activating SelectedAppActivator")
//        let redirector = SelectedAppActivator()
//        let interaction = INInteraction(intent: redirector, response: nil)
//
//        do {
//            try interaction.donate()
//        } catch {
//            print("Failed to donate interaction: \(error.localizedDescription)")
//        }
//    }
//}
