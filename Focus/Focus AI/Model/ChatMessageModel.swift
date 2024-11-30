//
//  ChatMessageModel.swift
//  Focus AI
//
//  Created by Ogabek Bakhodirov on 30/11/24.
//

import Foundation

struct ChatMessage: Codable {
    let id: String        // Unique ID for the message
    let timestamp: Date   // When the message was sent
    let sender: SenderType // User or AI
    let content: String   // The message text or data
    let messageType: MessageType // Text, image, etc
    let contextId: String? // Links to a ChatContext for adaptive logic

    
}

//struct ChatContext: Codable {
//    let id: String           // Unique ID for the context/session
//    let createdAt: Date      // When the session started
//    let messages: [ChatMessage] // Array of messages in this context
//    let metadata: [String: String]? // Key-value pairs for AI (e.g., intents)
//}

struct TrainingPrompt {
    let id: String
    let prompt: String
    let response: String
    let timestamp: Date
    let tags: [String]
}



//MARK: -  Foydalanuvchi kontekstiga asoslangan javoblarni tayyorlash
func generateAIResponse(for user: User, message: String) -> String {
    // Qiziqishlarga asoslangan javob
    if let interest = user.preferences.first(where: { message.lowercased().contains($0) }) {
        return "You mentioned \(interest). What specifically interests you about it?"
    }
    
    // Oldingi javoblar asosida kontekst qo‘shish
    if let lastMessage = user.conversationHistory.last {
        return "Earlier you said: '\(lastMessage.content)'. Could you tell me more about it?"
    }
    
    return "That's interesting! Tell me more."
}

////use case 
//let message = "I want to learn more about algebra."
//let response = generateAIResponse(for: user, message: message)
//addMessageToHistory(for: &user, message: message, response: response)
//
//print(response) // "You mentioned math. What specifically interests you about it?"


//MARK: - AI Response with User data
func generateAIResponse(user: User, message: String) -> String {
    // Foydalanuvchi haqida umumiy ma’lumot
    let userInfo = "User Info: Name: \(user.name), Age: \(user.age), Gender: \(user.gender), Country: \(user.country)."
    
    // AIga yuboriladigan so‘rov
    let fullPrompt = """
    \(userInfo)
    Conversation: \(message)
    """
    
//    let aiResponse = sendPromptToAI(prompt: fullPrompt)
    return "aiResponse"
}



