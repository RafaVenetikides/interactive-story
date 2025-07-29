//
//  DialogueManager.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class DialogueManager {
    private let nodes: [String: DialogueNode]
    private var currentNodeId: String
    
    init(startNodeId: String, nodes: [String: DialogueNode]) {
        self.currentNodeId = startNodeId
        self.nodes = nodes
    }
    
    func getCurrentNode() -> DialogueNode? {
        return nodes[currentNodeId]
    }
    
    func selectOption(_ options: DialogueOption) {
        if let nextId = options.nextNodeId {
            currentNodeId = nextId
        }
    }
}
