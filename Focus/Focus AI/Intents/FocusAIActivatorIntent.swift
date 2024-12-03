//
//  FocusAIActivatorIntent.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 01/12/24.
//


import AppIntents
import UIKit


//struct FocusAIActivatorIntent: AppIntent, OpenIntent {
//    static let title: LocalizedStringResource = "Focus AI Activator"
//
//    @Parameter(title: "App name must be SELECTED!")
//    var target: TrailEntity
//
//    @MainActor
//    func perform() async throws -> some IntentResult {
////        UIApplication.shared.openURL(URL(filePath: "focus://pause"))
//        
//        return .result() 
//    }
//
//    static var parameterSummary: some ParameterSummary {
//        Summary("Open \( \.$target)")
//    }
//
//    //MARK: - May be used for reopening app 
////    Userni Focus AI orqali appga yuborishda ishlatilishi mumkin
////    static let openAppWhenRun: Bool = true 
//}

struct FocusAIActivatorIntent: AppIntent {
    static var title: LocalizedStringResource = "Focus AI Activator"

    @Parameter(title: "Ilova nomi tanlangan bo'lishi shart!")
    var data: DataManager

    @MainActor
    func perform() async throws -> some IntentResult {
//        Navigator.shared.openShelf(shelf)
        SELECTED_APP = data
        print(SELECTED_APP?.app_url)
        return .result()
    }

    static var parameterSummary: some ParameterSummary {
        Summary("Tanlangan Ilova -> \(\.$data)")
    }

    static var openAppWhenRun: Bool = true
}

//struct TrailEntity: AppEntity {
//    
//    var id: String{name}
//     
//    @Property(title: "Trail Name")
//    var name: String
//    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Trail"
//    var displayRepresentation: DisplayRepresentation {
//        DisplayRepresentation (
//            title: "name",
//            image: .init(named: "arrow.up"))
//    }
//
//    static var defaultQuery = TrailEntityQuery ()
//}

//struct TrailEntityQuery: EntityQuery {
//    func entities (for identifiers: [TrailEntity.ID]) async throws -> [TrailEntity] {
//        TrailDataManager.shared.trails(with: identifiers)
////        (with: identifiers).map { TrailEntity (trail:) }
//        let result: [TrailEntity]  = []
//        return result
//    }
//}

//extension TrailEntityQuery {
//    func allEntities () async throws -> [TrailEntity] {
////        TrailDataManager.shared.trails { TrailEntity(name: <#T##EntityProperty<String>#>) }
//        var result: [TrailEntity]  = []
//        return result
//    }
//}

//class TrailDataManager {
//    static let shared = TrailDataManager()
//    
//    private var trails: [TrailEntity] = [
////        TrailEntity(name: "Trail A", id: "1"),
//        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "salom"))),
//        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "hi"))),
//        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "privet")))
//    ]
//    
//    func trails(with identifiers: [String]) -> [TrailEntity] {
//        var returnValue: [TrailEntity] = []
//        for i in identifiers {
//            let entityProperty = EntityProperty<String>(title: LocalizedStringResource(stringLiteral: i)) 
//            returnValue.append(TrailEntity(name: entityProperty))
//        } 
//        return returnValue
//    }
//    
//    func allTrails() -> [TrailEntity] {
//        trails
//    }
//}



