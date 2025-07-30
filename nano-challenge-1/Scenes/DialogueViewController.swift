//
//  DialogViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 28/07/25.
//

import UIKit

class DialogueViewController: UIViewController {
    private let dialogView = DialogueView()
    private var nextDialogueId: String?
    private var startNodeId: String = "start"
    
    private var manager: DialogueManager!
    
    init(startNodeId: String = "start") {
        super.init(nibName: nil, bundle: nil)
        self.startNodeId = startNodeId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = dialogView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupDialogue()
        renderCurrentNode()
    }
    
    private func setupDialogue() {
        let nodes = DialogueRepository.allNodes()
        
        manager = DialogueManager(startNodeId: startNodeId, nodes: nodes)
    }
    
    private func renderCurrentNode() {
        guard let node = manager.getCurrentNode() else { return }
        
        dialogView.configure(characterName: node.characterName, dialogueText: node.text)
        
        dialogView.setOptions(node.options, handler: { [weak self] selectedOption in
            self?.handleOption(selectedOption)})
    }
    
    private func handleOption(_ option: DialogueOption) {
        guard let nextNodeId = option.nextNodeId else { return }
        
        nextDialogueId = nextNodeId
        
        let battleVC = BattleViewController()
        battleVC.onBattleFinished = { [weak self] in
            self?.continueDialogueAfterBattle()
            self?.navigationController?.popViewController(animated: false)
        }
        navigationController?.pushViewController(battleVC, animated: false)
    }
    
    private func continueDialogueAfterBattle() {
        guard let nextId = nextDialogueId else { return }
        manager.goToNode(nextId)
        renderCurrentNode()
    }
}

