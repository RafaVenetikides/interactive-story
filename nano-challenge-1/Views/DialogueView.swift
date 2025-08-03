//
//  DialogueView.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class DialogueView: UIView {
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ComicNeue-Bold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterNameField: UIView = {
       let view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dialogueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ComicNeue-Regular", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dialogueField: UIView = {
        let view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        buttonsStackView.axis = .vertical
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
        addSubview(characterNameField)
        addSubview(dialogueField)
        addSubview(buttonsStackView)
        characterNameField.addSubview(characterNameLabel)
        dialogueField.addSubview(dialogueLabel)
        
        NSLayoutConstraint.activate([
            characterNameField.bottomAnchor.constraint(equalTo: dialogueField.topAnchor, constant: -20),
            characterNameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterNameField.heightAnchor.constraint(equalToConstant: 40),
            characterNameField.widthAnchor.constraint(equalTo: characterNameLabel.widthAnchor, constant: 40),
            characterNameLabel.centerXAnchor.constraint(equalTo: characterNameField.centerXAnchor),
            characterNameLabel.centerYAnchor.constraint(equalTo: characterNameField.centerYAnchor),
            
            dialogueField.centerYAnchor.constraint(equalTo: centerYAnchor),
            dialogueField.centerXAnchor.constraint(equalTo: centerXAnchor),
            dialogueField.widthAnchor.constraint(equalToConstant: 436),
            dialogueField.heightAnchor.constraint(equalToConstant: 190),
            dialogueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dialogueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonsStackView.topAnchor.constraint(equalTo: dialogueField.bottomAnchor, constant: 40),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func configure(characterName: String, dialogueText: String) {
        characterNameLabel.text = characterName
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
            handler(DialogueOption(text: "sla", nextEventId: "start"))}), for: .touchUpInside)
            buttonsStackView.addArrangedSubview(button)
        }
    }
}
