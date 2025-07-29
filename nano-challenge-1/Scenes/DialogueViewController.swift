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
                    DialogueOption(text: "resposta 1", nextNodeId: "resposta 1"),
                    DialogueOption(text: "resposta 2", nextNodeId: "resposta 2")
                ]
            ),
            "resposta 1": DialogueNode(
                id: "resposta 1",
                characterName: "character 2",
                text: "super dialogo 2",
                options: []
            ),
            "resposta 2": DialogueNode(
                id: "resposta 2",
                characterName: "character 3",
                text: "super dialogo 3",
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

