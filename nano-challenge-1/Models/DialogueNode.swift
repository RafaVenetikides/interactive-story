//
//  DialogueNode.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import Foundation

struct DialogueOption {
    let text: String
    let nextEventId: String?
}

struct DialogueNode {
    let id: String
    let characterName: String
    let leftCharacterImage: String
    let rightCharacterImage: String
    let text: String
    let options: [DialogueOption]
}
