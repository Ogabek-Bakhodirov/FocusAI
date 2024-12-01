//
//  FocusAIActivatorIntent.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 01/12/24.
//

//import Foundation
//import AppIntents
//// 1
//struct FocusAIActivatorIntent: AppIntent {
//  // 2
//    static let title: LocalizedStringResource = "Activates FocusAI for a quick QA. Continue to APP once conversation finished"
//
//  // 3
//  func perform() async throws -> some IntentResult & ProvidesDialog {
//    // 5
//    return .result(dialog: "Logged a 15 minute break")
//  }
//}


//// 1
//struct FocusAIActivatorIntent: AppIntent {
//    // 2
//    static let title: LocalizedStringResource = "Activates FocusAI for a quick QA. Continue to APP once conversation finished"
//
//    // 3: Define a parameter (shortcut variable)
//    @Parameter(title: "Application Name")
//    var appName: String
//    
//    // 4: Perform action using the shortcut variable
//    func perform() async throws -> some IntentResult & ProvidesDialog {
//        // 5: Use the appName parameter in the result message
//        let resultMessage = "Logged a 15 minute break. Continue to \(appName) once the conversation is finished."
//        
//        // 6: Return the result with dynamic content based on the parameter (appName)
//        return .result(dialog: "resultMessage")
//    }
//}

import AppIntents
import UIKit

//// Define the intent
//struct GreetUserIntent: AppIntent {
//    static let title: LocalizedStringResource = "Send a Greeting"
//
//    @Parameter(title: "Recipient Name", default: "Friend")
//    var recipientName: String
//
//    func perform() async throws -> some IntentResult & ProvidesDialog {
//        
//        return .result(dialog: IntentDialog(stringLiteral: recipientName))
//    }
//}

struct FocusAIActivatorIntent: AppIntent { //OpenIntent
            
    static let title: LocalizedStringResource = "Send a Greeting"

    @Parameter(title: "Recipient Name")
    var recipientName : String //TrailEntity

    func perform() async throws -> some IntentResult & ProvidesDialog {
        // Notify the app to handle the URL opening

        return .result(dialog: IntentDialog(stringLiteral: "recipientName"))
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary ("Open \(\.$recipientName)")
    }

    static let openAppWhenRun: Bool = true
}
//
//struct TrailEntity: AppEntity {
//     
//    @Property(title: "Trail Name")
//    var name: String
//    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Trail"
//    var displayRepresentation: DisplayRepresentation {
//        DisplayRepresentation (title: "name"), image: Image (named: imageName))
//    }
//    var id: Trail.ID
//    static var defaultQuery = TrailEntityQuery ()
//}
//
//struct TrailEntityQuery: EntityQuery {
//    func entities (for identifiers: [TrailEntity.ID]) async throws -> [TrailEntity] {
//        TrailDataManager.shared.trails (with: identifiers)
//            .map { TrailEntity (trail: $0) }
//    }
//}
//
//extension TrailEntityQuery: EnumerableEntityQuery {
//    func allEntities () async throws -> [TrailEntity] {
//        TrailDataManager.shared.trails.map { TrailEntity(trail: $0) }
//    }
//}
