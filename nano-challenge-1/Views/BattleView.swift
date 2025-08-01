//
//  BattleView.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

final class BattleView: UIView {
    
    private var enemyShieldImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "shield")
        return image
    }()
    
    private var enemyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ComicNeue-Bold", size: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyHealthBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .trackGray
        progressView.progressTintColor = .progressRed
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private var enemyHealthStroke: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 3
        return view
    }()
    
    private var enemyHealthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ComicNeue-Bold", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var enemyHealthField: UIView = {
        let view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private var enemyShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ComicNeue-Bold", size: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var enemyShieldStack: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [enemyShieldImage, enemyShieldLabel])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 3
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private var enemyShieldField: UIView = {
        let view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private var enemyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var enemyStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [enemyImage, enemyNameLabel, enemyHealthField, enemyShieldField])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
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
    
    private var playerShieldImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "shield")
        return image
    }()
    
    private var playerHealthBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.trackTintColor = .trackGray
        progressView.progressTintColor = .progressRed
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
    
    private var playerHealthStroke: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var playerHealthField: UIView = {
        let view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var playerShieldLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "ComicNeue-Bold", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playerShieldStack: UIStackView = {
       let sv = UIStackView(arrangedSubviews: [playerShieldImage, playerShieldLabel])
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.spacing = 3
        sv.alignment = .center
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private var playerShieldField: UIView = {
        var view = UIView()
        view.backgroundColor = .fieldBackground
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private lazy var playerStackInfo: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playerShieldField, playerHealthField])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
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
        enemyHealthStroke.addSubview(enemyHealthBar)
        enemyHealthField.addSubview(enemyHealthStroke)
        
        enemyShieldField.addSubview(enemyShieldStack)
        
        playerHealthBar.addSubview(playerHealthLabel)
        playerHealthStroke.addSubview(playerHealthBar)
        playerHealthField.addSubview(playerHealthStroke)
        
        playerShieldField.addSubview(playerShieldStack)
        
        NSLayoutConstraint.activate([
            enemyStackInfo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            enemyStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            enemyHealthLabel.centerYAnchor.constraint(equalTo: enemyHealthBar.centerYAnchor),
            enemyHealthLabel.centerXAnchor.constraint(equalTo: enemyHealthBar.centerXAnchor),
            enemyHealthBar.heightAnchor.constraint(equalToConstant: 25),
            enemyHealthBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.55),
            enemyHealthStroke.widthAnchor.constraint(equalTo: enemyHealthBar.widthAnchor),
            enemyHealthStroke.heightAnchor.constraint(equalTo: enemyHealthBar.heightAnchor),
            enemyHealthStroke.centerXAnchor.constraint(equalTo: enemyHealthBar.centerXAnchor),
            enemyHealthStroke.centerYAnchor.constraint(equalTo: enemyHealthBar.centerYAnchor),
            
            enemyHealthBar.centerXAnchor.constraint(equalTo: enemyHealthField.centerXAnchor),
            enemyHealthBar.centerYAnchor.constraint(equalTo: enemyHealthField.centerYAnchor),
            enemyHealthField.heightAnchor.constraint(equalTo: enemyHealthBar.heightAnchor, multiplier: 1.6),
            enemyHealthField.widthAnchor.constraint(equalTo: enemyHealthBar.widthAnchor, multiplier: 1.15),
            
            enemyShieldField.heightAnchor.constraint(equalToConstant: 35),
            enemyShieldField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            enemyShieldStack.centerXAnchor.constraint(equalTo: enemyShieldField.centerXAnchor),
            enemyShieldStack.centerYAnchor.constraint(equalTo: enemyShieldField.centerYAnchor),
            enemyShieldStack.heightAnchor.constraint(equalTo: enemyShieldField.heightAnchor, multiplier: 0.75),
            
            playerStackInfo.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -20),
            playerStackInfo.centerXAnchor.constraint(equalTo: centerXAnchor),
            playerHealthLabel.centerYAnchor.constraint(equalTo: playerHealthBar.centerYAnchor),
            playerHealthLabel.centerXAnchor.constraint(equalTo: playerHealthBar.centerXAnchor),
            playerHealthBar.heightAnchor.constraint(equalToConstant: 35),
            playerHealthBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            playerHealthStroke.widthAnchor.constraint(equalTo: playerHealthBar.widthAnchor),
            playerHealthStroke.heightAnchor.constraint(equalTo: playerHealthBar.heightAnchor),
            playerHealthStroke.centerXAnchor.constraint(equalTo: playerHealthBar.centerXAnchor),
            playerHealthStroke.centerYAnchor.constraint(equalTo: playerHealthBar.centerYAnchor),
            
            playerHealthBar.centerXAnchor.constraint(equalTo: playerHealthField.centerXAnchor),
            playerHealthBar.centerYAnchor.constraint(equalTo: playerHealthField.centerYAnchor),
            playerHealthField.heightAnchor.constraint(equalTo: playerHealthBar.heightAnchor, multiplier: 1.6),
            playerHealthField.widthAnchor.constraint(equalTo: playerHealthBar.widthAnchor, multiplier: 1.1),
            
            playerShieldField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.23),
            playerShieldField.heightAnchor.constraint(equalToConstant: 40),
            playerShieldStack.centerXAnchor.constraint(equalTo: playerShieldField.centerXAnchor),
            playerShieldStack.centerYAnchor.constraint(equalTo: playerShieldField.centerYAnchor),
            playerShieldStack.heightAnchor.constraint(equalTo: playerShieldField.heightAnchor, multiplier: 0.8),
            
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
