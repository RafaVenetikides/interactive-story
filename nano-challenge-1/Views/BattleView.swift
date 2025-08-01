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
        label.font = UIFont(name: "ComicNeue-Bold", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyHealthBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .red
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private var enemyHealthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ComicNeue-Bold", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont(name: "ComicNeue-Bold", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var enemyStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [enemyImage, enemyNameLabel, enemyHealthBar, enemyShieldLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
//    private var playerNameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: "ComicNeue-Bold", size: 27)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private var playerHealthBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .red
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private var playerHealthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ComicNeue-Bold", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playerShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont(name: "ComicNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playerStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playerShieldLabel, playerHealthBar])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
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
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        backgroundColor = .white
        addSubview(enemyStackInfo)
        addSubview(playerStackInfo)
        addSubview(buttonsStackView)
        
        enemyHealthBar.addSubview(enemyHealthLabel)
        playerHealthBar.addSubview(playerHealthLabel)
        
        NSLayoutConstraint.activate([
            enemyStackInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            enemyStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            enemyHealthLabel.centerYAnchor.constraint(equalTo: enemyHealthBar.centerYAnchor),
            enemyHealthLabel.centerXAnchor.constraint(equalTo: enemyHealthBar.centerXAnchor),
            enemyHealthBar.heightAnchor.constraint(equalToConstant: 25),
            enemyHealthBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55),
            
            playerStackInfo.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -20),
            playerStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerHealthLabel.centerYAnchor.constraint(equalTo: playerHealthBar.centerYAnchor),
            playerHealthLabel.centerXAnchor.constraint(equalTo: playerHealthBar.centerXAnchor),
            playerHealthBar.heightAnchor.constraint(equalToConstant: 35),
            playerHealthBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configure(enemy: Character, player: Character, onAttack: @escaping () -> Void, onDefense: @escaping () -> Void) {
        enemyNameLabel.text = enemy.name
        enemyHealthLabel.text = "\(enemy.currentHealth)/\(enemy.totalHealth)"
        enemyShieldLabel.text = "\(enemy.shield)"
        enemyImage.image = UIImage(named: enemy.image ?? "")
        
//        playerNameLabel.text = player.name
        playerHealthLabel.text = "\(player.currentHealth)/\(player.totalHealth)"
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
