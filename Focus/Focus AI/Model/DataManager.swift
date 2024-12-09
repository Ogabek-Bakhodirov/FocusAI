//
//  DataManager.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 04/12/24.
//

import AppIntents


enum DataManager: String {
    case instagram
    case telegram
    case youtube
    case tiktok
    case clashofclans
    case pubg
    case facebook
    case linkedin
    case twogis
    
    var app_url: String {
        switch self {
        case .instagram:
            return "instagram://"
        case .telegram:
            return "telegram://"
        case .youtube:
            return "youtube://"
        case .tiktok:
            return "tiktok://"
        case .clashofclans:
            return "clashofclans://"
        case .pubg:
            return "pubg://"
        case .facebook:
            return "facebook://"
        case .linkedin:
            return "linkedin://"
        case .twogis:
            return "2gis://"
        default: return "Not Found"
        }
    }
}

extension DataManager: AppEnum {
    static var caseDisplayRepresentations: [DataManager : DisplayRepresentation] = [
        .instagram: "Instagram",
        .telegram: "Telegram",
        .youtube: "You Tube",
        .tiktok: "Tik Tok",
        .clashofclans: "Clash of Clans",
        .pubg: "PUBG",
        .facebook: "Facebook",
        .linkedin: "Linkedin",
        .twogis: "2Gis",
    ]
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "DataManager"
}


 
