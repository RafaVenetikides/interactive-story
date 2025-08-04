//
//  DialogueView.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class DialogueView: UIView {
    
    private let characterLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let characterRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.transform = CGAffineTransform(scaleX: -1, y: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ComicNeue-Bold", size: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let characterNameField: UIView = {
       let view = UIView()
        view.backgroundColor = .fieldBackground.withAlphaComponent(0.8)
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
        buttonsStackView.spacing = 20
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonsStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(characterLeftImageView)
        addSubview(characterRightImageView)
        addSubview(characterNameField)
        addSubview(dialogueField)
        addSubview(buttonsStackView)
        characterNameField.addSubview(characterNameLabel)
        dialogueField.addSubview(dialogueLabel)
        
        NSLayoutConstraint.activate([
            characterLeftImageView.bottomAnchor.constraint(equalTo: dialogueField.topAnchor),
            characterLeftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -35),
            
            characterRightImageView.bottomAnchor.constraint(equalTo: dialogueField.topAnchor, constant: 3),
            characterRightImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            characterNameField.bottomAnchor.constraint(equalTo: dialogueField.topAnchor, constant: -5),
            characterNameField.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterNameField.heightAnchor.constraint(equalToConstant: 40),
            characterNameField.widthAnchor.constraint(equalTo: characterNameLabel.widthAnchor, constant: 40),
            characterNameLabel.centerXAnchor.constraint(equalTo: characterNameField.centerXAnchor),
            characterNameLabel.centerYAnchor.constraint(equalTo: characterNameField.centerYAnchor),
            
            dialogueField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 70),
            dialogueField.centerXAnchor.constraint(equalTo: centerXAnchor),
            dialogueField.widthAnchor.constraint(equalToConstant: 436),
            dialogueField.heightAnchor.constraint(equalToConstant: 190),
            dialogueLabel.centerYAnchor.constraint(equalTo: dialogueField.centerYAnchor),
            dialogueLabel.centerXAnchor.constraint(equalTo: dialogueField.centerXAnchor),
            dialogueLabel.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            buttonsStackView.topAnchor.constraint(equalTo: dialogueField.bottomAnchor, constant: 40),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonsStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
    
    func configure(characterName: String, dialogueText: String, leftCharacterImage: String, rightCharacterImage: String) {
        characterNameLabel.text = characterName
        dialogueLabel.text = dialogueText
        characterLeftImageView.image = UIImage(named: leftCharacterImage)
        characterRightImageView.image = UIImage(named: rightCharacterImage)
    }
    
    func setOptions(_ options: [DialogueOption], handler: @escaping (DialogueOption) -> Void) {
        buttonsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for option in options {
            let button = UIButton(type: .system)
            button.setTitle(option.text, for: .normal)
            
            button.backgroundColor = .fieldBackground
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "ComicNeue-Bold", size: 18)
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            
            button.addAction(UIAction(handler: {_ in
                handler(option)}), for: .touchUpInside)
            buttonsStackView.addArrangedSubview(button)
        }
        
        if options.isEmpty {
            let button = UIButton(type: .system)
            button.setTitle("Game Over", for: .normal)
            
            button.backgroundColor = .fieldBackground
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "ComicNeue-Bold", size: 18)
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            button.titleLabel?.numberOfLines = 0
            
            button.addAction(UIAction(handler: {_ in
            handler(DialogueOption(text: "sla", nextEventId: "start"))}), for: .touchUpInside)
            buttonsStackView.addArrangedSubview(button)
        }
    }
}
