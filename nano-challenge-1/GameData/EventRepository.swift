//
//  EventRepository.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 30/07/25.
//

struct EventRepository {
    static func allEvents() -> [String: GameEvent] {
        return [
            "start": GameEvent(
                id: "start",
                type: .dialogue(
                    DialogueNode(
                        id: "start",
                        characterName: "character 1",
                        text: "super dialogo",
                        options: [
                            DialogueOption(text: "resposta 1", nextEventId: "battle1"),
                            DialogueOption(text: "resposta 2", nextEventId: "resposta2")
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "battle1" : GameEvent(
                id: "battle1",
                type: .battle(
                    Character(
                        name: "Talking Cricket",
                        totalHealth: 40,
                        currentHealth: 40,
                        shield: 0,
                        attackPower: 5,
                        image: "cricket"
                    )
                ),
                nextEventId: "resposta1"
            ),
            "resposta1": GameEvent(
                id: "resposta1",
                type: .dialogue(
                    DialogueNode(
                        id: "resposta1",
                        characterName: "character 2",
                        text: "super dialogo 2",
                        options: [
                            DialogueOption(text: "Final 1", nextEventId: "final1"),
                            DialogueOption(text: "resposta 3", nextEventId: "resposta3")
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "resposta2": GameEvent(
                id: "resposta2",
                type: .dialogue(
                    DialogueNode(
                        id: "resposta2",
                        characterName: "character 3",
                        text: "super dialogo 3",
                        options: [
                            DialogueOption(text: "resposta 3", nextEventId: "resposta3"),
                            DialogueOption(text: "resposta 4", nextEventId: "resposta4")
                        ]
                    )
                ),
                nextEventId: nil
            ),
            "resposta3": GameEvent(
                id: "resposta3",
                type: .dialogue(
                    DialogueNode(
                        id: "resposta3",
                        characterName: "character 4",
                        text: "super dialogo 4",
                        options: []
                    )
                ),
                nextEventId: nil
            ),
            "resposta4": GameEvent(
                id: "resposta4",
                type: .dialogue(
                    DialogueNode(
                        id: "resposta4",
                        characterName: "character 5",
                        text: "dialogo 5",
                        options: []
                    )
                ),
                nextEventId: nil
            ),
            "final1": GameEvent(
                id: "final1",
                type: .dialogue(
                    DialogueNode(
                        id: "final1",
                        characterName: "character 5",
                        text: "dialogo final",
                        options: []
                    )
                ),
                nextEventId: nil
            )
        ]
    }
}
