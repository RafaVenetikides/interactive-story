//
//  BattleViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class BattleViewController: UIViewController {
    
    private let battleView = BattleView()
    
    private var playerName: String = "Player"
    private var playerHealth = 100
    private var playerShield = 0
    private var playerAttackPower = 10
    
    private var enemyName: String = "Enemy"
    private var enemyHealth = 100
    private var enemyShield = 0
    private var enemyAttackPower = 5
    
    override func loadView() {
        self.view = battleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func updateUI() {
        battleView.updatePlayerHealth(playerHealth)
        battleView.updateEnemyHealth(enemyHealth)
    }
}
