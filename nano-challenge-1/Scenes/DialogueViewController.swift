//
//  DialogViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 28/07/25.
//

import UIKit

class DialogueViewController: UIViewController {
    private let dialogView = DialogueView()
    
    private var manager: DialogueManager!
    
    override func loadView() {
        self.view = dialogView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDialogue()
        renderCurrentNode()
    }
    
    private func setupDialogue() {
        let nodes: [String: DialogueNode] = [
            "start": DialogueNode(
                id: "start",
                characterName: "character 1",
                text: "super dialogo",
                options: [
                    DialogueOption(text: "resposta 1", nextNodeId: "resposta1"),
                    DialogueOption(text: "resposta 2", nextNodeId: "resposta2")
                ]
            ),
            "resposta1": DialogueNode(
                id: "resposta1",
                characterName: "character 2",
                text: "super dialogo 2",
                options: [
                    DialogueOption(text: "Final 1", nextNodeId: "final1"),
                    DialogueOption(text: "resposta 3", nextNodeId: "resposta3")]
            ),
            "resposta2": DialogueNode(
                id: "resposta2",
                characterName: "character 3",
                text: "super dialogo 3",
                options: [
                    DialogueOption(text: "resposta 3", nextNodeId: "resposta3"),
                    DialogueOption(text: "resposta 4", nextNodeId: "resposta4")
                ]
            ),
            "resposta3": DialogueNode(
                id: "resposta3",
                characterName: "character 4",
                text: "super dialogo 4",
                options: []
            ),
            "resposta4": DialogueNode(
                id: "resposta4",
                characterName: "character 5",
                text: "dialogo 5",
                options: []
            ),
            "final1": DialogueNode(
                id: "final1",
                characterName: "character 5",
                text: "dialogo final",
                options: []
            )
        ]
        
        manager = DialogueManager(startNodeId: "start", nodes: nodes)
    }
    
    private func renderCurrentNode() {
        guard let node = manager.getCurrentNode() else { return }
        
        dialogView.configure(characterName: node.characterName, dialogueText: node.text)
        
        dialogView.setOptions(node.options, handler: { [weak self] selectedOption in
            self?.handleOption(selectedOption)})
    }
    
    private func handleOption(_ option: DialogueOption) {
        manager.selectOption(option)
        renderCurrentNode()
    }
}

