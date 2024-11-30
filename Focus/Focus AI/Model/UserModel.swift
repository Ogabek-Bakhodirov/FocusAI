//
//  UserModel.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 30/11/24.
//

import Foundation

struct User {
    // Unikal identifikator
    var userId: String
    
    // Foydalanuvchi asosiy ma'lumotlari
    var name: String
    var age: Int
    var gender: String
    var country: String
    var lang: Language
    
    // Foydalanuvchi qiziqishlari
    var preferences: [String] // Masalan: ["math", "science", "history"]
    
    // Foydalanuvchi shaxsiy xabarlar tarixi
    var conversationHistory: [Message] // Quyida Message modeli
    
    // Oxirgi suhbat qachon bo'lgan
    var lastInteractionDate: Date?
    
    // Foydalanuvchi sozlamalari
    var settings: UserSettings
    
    mutating func addPreferences(newPreference: [String]) {
        preferences += newPreference
    }
    
    
    //MARK: - Detect preferences
    func analyzeMessage(for message: String) -> [String] {
        let keywords = ["math", "science", "technology", "art", "history"]
        var detectedPreferences: [String] = []
        
        for keyword in keywords {
            if message.lowercased().contains(keyword) {
                detectedPreferences.append(keyword)
            }
        }
        return detectedPreferences
    }
    
    //MARK: - Add conversation to history 
    mutating func addMessage(id: String, sender: SenderType, content: String, messageType: MessageType) {
        let newMessage = Message(id: id, sender: sender, content: content, timestamp: Date(), messageType: messageType)
            conversationHistory.append(newMessage)
            
            if sender == .user {
                // Yangi xabarga asoslanib qiziqishlarni yangilash
                let detectedPreferences = analyzeMessage(for: content)
                if !detectedPreferences.isEmpty {
                    addPreferences(newPreference: detectedPreferences)
                }
            } 
            
            // Oxirgi o'zaro aloqani yangilash
            lastInteractionDate = Date()
        }
}


enum Language: String, Codable {
    case uzb, rus, eng
}


struct ChatContext: Codable {
    let id: String           // Unique ID for the context/session
    let createdAt: Date      // When the session started
    let messages: [Message] // Array of messages in this context
    let metadata: [String: String]? // Key-value pairs for AI (e.g., intents)
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, messages, metadata
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        createdAt = try container.decode(Date.self, forKey: .createdAt)
        messages = try container.decode([Message].self, forKey: .messages)
        metadata = try container.decodeIfPresent([String: String].self, forKey: .metadata)
    }
}


// Suhbatdagi xabar modeli
struct Message: Codable {
    var id: String
    var sender: SenderType // "user" yoki "ai"
    var content: String // Xabar matni
    var timestamp: Date // Vaqt
    var messageType: MessageType
}

enum MessageType: String, Codable {
    case text
    case image
    case multipleChoice
    case other
}

enum SenderType: String, Codable {
    case user, ai
}

// Foydalanuvchi sozlamalari modeli
struct UserSettings {
    var prefersPersonalizedReplies: Bool // AI shaxsiylashtirilgan javoblar bersinmi
    var allowDataUsageForAI: Bool // AI foydalanuvchi ma'lumotlaridan foydalansinmi
}



//MARK: - GPT ning takliflari
//1. Qiziqishlarni aniqlashni takomillashtirish:
//Sizning analyzeMessage(for:) metodida foydalanuvchining xabaridagi so'zlarni qidirib, ularga mos qiziqishlarni aniqlayapsiz. Bu metodni biroz takomillashtirish mumkin. Misol uchun, keywords ro'yxatini faqat matnli so'zlar bilan cheklamasdan, aniq mavzularni ham qo'shish mumkin.

//Qiziqishlarni avtomatik tahlil qilish: AI'ni foydalanuvchining tarixiy xabarlaridan foydalangan holda yanada samarali qilish uchun, vaqt o'tgan sayin yanada ilg'or algoritmlar qo'llanilishi mumkin.
//Ma'lumotlar sinxronizatsiyasi: Foydalanuvchi qiziqishlari va xabar tarixi Firebase yoki boshqa serverga yuborilishi mumkin, bu esa ma'lumotlarni saqlash va tahlil qilishni osonlashtiradi.

var USER = User(userId: "bakhodirov",
                        name: "BOA", 
                        age: 21, 
                        gender: "Male",
                        country: "Uzbekiston",
                        lang: .eng, 
                        preferences: ["start up"], 
                        conversationHistory: [], 
                        settings: UserSettings(prefersPersonalizedReplies: true, allowDataUsageForAI: true))
