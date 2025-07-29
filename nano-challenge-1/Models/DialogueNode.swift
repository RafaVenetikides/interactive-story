//
//  DialogueNode.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import Foundation

struct DialogueOption {
    let text: String
    let nextNodeId: String?
}

struct DialogueNode {
    let id: String
    let characterName: String
    let text: String
    let options: [DialogueOption]
}
