//
//  DialogueViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 28/07/25.
//

import UIKit

class DialogueViewController: UIViewController {
    private let dialogView = DialogueView()
    
    private let dialogueNode: DialogueNode
    var onOptionSelected: ((DialogueOption) -> Void)?
    
    
    init(dialogueNode: DialogueNode) {
        self.dialogueNode = dialogueNode
        super.init(nibName: nil, bundle: nil)
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
        renderCurrentNode()
    }
    
    private func renderCurrentNode() {
        
        dialogView.configure(characterName: dialogueNode.characterName, dialogueText: dialogueNode.text)
        
        dialogView.setOptions(dialogueNode.options, handler: { [weak self] selectedOption in
            self?.handleOption(selectedOption)})
    }
    
    private func handleOption(_ option: DialogueOption) {
        onOptionSelected?(option)
    }
}

