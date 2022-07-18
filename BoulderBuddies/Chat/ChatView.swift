import SwiftUI

struct ChatView: View {
    @State
    private var chatMessages: [ChatMessage] = []
    @State
    private var text: String = ""
    
    private let stream = WebSocketStream(url: "wss://1eobp4oeh8.execute-api.ap-southeast-1.amazonaws.com/dev")
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(chatMessages) { chatMessage in
                            ChatMessageRow(
                                message: chatMessage
                            )
                        }
                    }
                }
                .task {
                    do {
                        for try await message in stream {
                            let newChatMessage = try message.getChatMessage()
                            chatMessages.append(newChatMessage)
                        }
                    } catch {
                        debugPrint("Oops something didn't go right")
                    }
                }
                
                HStack {
                    TextField("Enter message", text: $text)
                    Button("Send", action: didTapSend)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                }
            }
            .padding(.horizontal, 16)
            .navigationTitle("Chat")
        }
    }
    
    func didTapSend() {
        print(text)
        stream.sendMessage(text: text)
    }
}

enum WebSocketError: Error {
    case invalidFormat
}

extension URLSessionWebSocketTask.Message {
    func getChatMessage() throws -> ChatMessage {
        switch self {
        case .string(let rawMessage):
            return ChatMessage(text: rawMessage)
        case .data:
            throw WebSocketError.invalidFormat
        @unknown default:
            throw WebSocketError.invalidFormat
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
