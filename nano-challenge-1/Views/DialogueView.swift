//
//  DialogueView.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class DialogueView: UIView {
    private let characterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dialogueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(characterLabel)
        addSubview(dialogueLabel)
        addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            characterLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            characterLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            characterLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            dialogueLabel.topAnchor.constraint(equalTo: characterLabel.bottomAnchor, constant: 20),
            dialogueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dialogueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            buttonsStackView.topAnchor.constraint(equalTo: dialogueLabel.bottomAnchor, constant: 40),
            buttonsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    func configure(characterName: String, dialogueText: String) {
        characterLabel.text = characterName
        dialogueLabel.text = dialogueText
    }
    
    func setOptions(_ options: [DialogueOption], handler: @escaping (DialogueOption) -> Void) {
        buttonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for option in options {
            let button = UIButton(type: .system)
            button.setTitle(option.text, for: .normal)
            button.addAction(UIAction(handler: {_ in
                handler(option)}), for: .touchUpInside)
            buttonsStackView.addArrangedSubview(button)
        }
        
        if options.isEmpty {
            let button = UIButton(type: .system)
            button.setTitle("Fim", for: .normal)
            button.addAction(UIAction(handler: {_ in
            handler(DialogueOption(text: "sla", nextNodeId: "start"))}), for: .touchUpInside)
            buttonsStackView.addArrangedSubview(button)
        }
    }
}
