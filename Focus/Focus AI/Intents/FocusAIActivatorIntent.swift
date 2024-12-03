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

struct TrailEntity: AppEntity {
    
    var id: String{name}
     
    @Property(title: "Trail Name")
    var name: String
    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Trail"
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation (
            title: "name",
            image: .init(named: "arrow.up"))
    }

    static var defaultQuery = TrailEntityQuery ()
}

struct TrailEntityQuery: EntityQuery {
    func entities (for identifiers: [TrailEntity.ID]) async throws -> [TrailEntity] {
        TrailDataManager.shared.trails(with: identifiers)
//        (with: identifiers).map { TrailEntity (trail:) }
        let result: [TrailEntity]  = []
        return result
    }
}

extension TrailEntityQuery {
    func allEntities () async throws -> [TrailEntity] {
//        TrailDataManager.shared.trails { TrailEntity(name: <#T##EntityProperty<String>#>) }
        var result: [TrailEntity]  = []
        return result
    }
}

class TrailDataManager {
    static let shared = TrailDataManager()
    
    private var trails: [TrailEntity] = [
//        TrailEntity(name: "Trail A", id: "1"),
        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "salom"))),
        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "hi"))),
        TrailEntity(name: EntityProperty<String>(title: LocalizedStringResource(stringLiteral: "privet")))
    ]
    
    func trails(with identifiers: [String]) -> [TrailEntity] {
        var returnValue: [TrailEntity] = []
        for i in identifiers {
            let entityProperty = EntityProperty<String>(title: LocalizedStringResource(stringLiteral: i)) 
            returnValue.append(TrailEntity(name: entityProperty))
        } 
        return returnValue
    }
    
    func allTrails() -> [TrailEntity] {
        trails
    }
}


enum DataManager: String {
    case instagram
    case telegram
    case youtube
    case tiktok
    case clashofclans
    case pubg
    case facebook
    case linkedin
    case some1
    case some2
    case some3, some4, some5, some6, some7, some8, some9
}

extension DataManager: AppEnum {
    static var caseDisplayRepresentations: [DataManager : DisplayRepresentation] = [
        .instagram: "Instagram",
        .telegram: "Telegram",
        .youtube: "You Tube",
        .tiktok: "tiktok",
        .clashofclans: "clashofclans",
        .pubg: "pubg",
        .facebook: "facebook",
        .linkedin: "linkedin",
        .some1: "some1",
        .some2: "some2",
        .some3: "some3",
        .some4: "some1",
        .some5: "some2",
        .some6: "some3",
        .some7: "some1",
        .some8: "some2",
        .some9: "some3",
    ]
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "DataManager"
}


struct OpenShelf: AppIntent {
    static var title: LocalizedStringResource = "Open Shelf"

    @Parameter(title: "Shelf")
    var shelf: DataManager

    @MainActor
    func perform() async throws -> some IntentResult {
//        Navigator.shared.openShelf(shelf)
        return .result()
    }

    static var parameterSummary: some ParameterSummary {
        Summary("Open \(\.$shelf)")
    }

    static var openAppWhenRun: Bool = true
}
