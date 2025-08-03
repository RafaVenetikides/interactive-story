//
//  GameEvent.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 01/08/25.
//

struct GameEvent {
    let id: String
    let type: EventType
    let nextEventId: String?
}

enum EventType {
    case dialogue(DialogueNode)
    case battle(Character)
}
