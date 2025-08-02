//
//  EventManager.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 01/08/25.
//

class EventManager {
    private var events: [String: GameEvent]
    private var currentEventId: String
    
    init(startEventId: String, events: [String: GameEvent]) {
        self.events = events
        self.currentEventId = startEventId
    }
    
    func getCurrentEvent() -> GameEvent? {
        return events[currentEventId]
    }
    
    func goToNextEvent() {
            guard let current = events[currentEventId],
                  let nextId = current.nextEventId else { return }
        currentEventId = nextId
    }
    
    func goToEventId(_ eventId: String) {
        currentEventId = eventId
    }
}
