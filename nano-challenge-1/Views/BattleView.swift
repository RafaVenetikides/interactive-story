//
//  BattleView.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

final class BattleView: UIView {
    
    private var enemyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyHealthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enemyStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [enemyNameLabel, enemyHealthLabel, enemyShieldLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playerHealthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .green
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playerShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playerStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playerNameLabel, playerHealthLabel, playerShieldLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var attackButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Attack", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var defenseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Defense", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [attackButton, defenseButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        addSubview(enemyStackInfo)
        addSubview(playerStackInfo)
        addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            enemyStackInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            enemyStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            playerStackInfo.topAnchor.constraint(equalTo: enemyStackInfo.bottomAnchor, constant: 20),
            playerStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonsStackView.topAnchor.constraint(equalTo: playerStackInfo.bottomAnchor, constant: 20),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configure(enemy: Character, player: Character, onAttack: @escaping () -> Void, onDefense: @escaping () -> Void) {
        enemyNameLabel.text = enemy.name
        enemyHealthLabel.text = "\(enemy.health)"
        enemyShieldLabel.text = "\(enemy.shield)"
        
        playerNameLabel.text = player.name
        playerHealthLabel.text = "\(player.health)"
        playerShieldLabel.text = "\(player.shield)"
        
        setActionsHandlers(onAttack: onAttack, onDefense: onDefense)
    }
    
    func updatePlayerHealth(_ health: Int) {
        playerHealthLabel.text = "\(health)"
    }
    
    func updatePlayerShield(_ shield: Int) {
        playerShieldLabel.text = "\(shield)"
    }
    
    func updateEnemyHealth(_ health: Int) {
        enemyHealthLabel.text = "\(health)"
    }
    
    func updateEnemyShield(_ shield: Int) {
        enemyShieldLabel.text = "\(shield)"
    }
    
    func setActionsHandlers(onAttack: @escaping () -> Void, onDefense: @escaping () -> Void) {
        attackButton.addAction(UIAction(handler: { _ in onAttack() }), for: .touchUpInside)
        defenseButton.addAction(UIAction(handler: { _ in onDefense() }), for: .touchUpInside)
    }
}
