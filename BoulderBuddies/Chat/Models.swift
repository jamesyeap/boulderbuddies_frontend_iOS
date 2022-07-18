import Foundation

struct ChatMessage: Decodable, Identifiable {
    let text: String
    
    var id: String {
        text
    }
}
