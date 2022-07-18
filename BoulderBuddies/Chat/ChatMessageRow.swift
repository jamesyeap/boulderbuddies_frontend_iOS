//
//  ChatMessageRow.swift
//  BoulderBuddies
//
//  Created by james.yeap on 18/7/22.
//

import SwiftUI

struct ChatMessageRow: View {
    var message: ChatMessage
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(message.text)
                        .font(.body)
                }
            }
            .padding(.horizontal, 16)
            
            Divider().padding(.leading, 16)
        }
    }
}

struct ChatMessageRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageRow(message: ChatMessage(text: "Example chat message."))
    }
}
