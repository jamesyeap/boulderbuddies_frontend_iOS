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
        VStack(alignment: .leading) {
            HStack() {
                Text(message.text)
                    .font(.body)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.size.width * 0.8)
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct ChatMessageRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageRow(message: ChatMessage(text: "Example chaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaat message."))
            .previewLayout(.sizeThatFits)
    }
}
