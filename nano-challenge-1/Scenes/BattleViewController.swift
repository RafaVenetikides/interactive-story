//
//  BattleViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class BattleViewController: UIViewController {
    
    private let battleView = BattleView()
    
    var onBattleFinished: (() -> Void)?
    
    private var playerName: String = "Player"
    private var playerHealth = 100
    private var playerShield = 0
    private var playerAttackPower = 10
    
    private var enemyName: String = "Enemy"
    private var enemyHealth = 10
    private var enemyShield = 0
    private var enemyAttackPower = 5
    
    override func loadView() {
        navigationItem.hidesBackButton = true
        self.view = battleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        battleView.configure(enemyName: enemyName, enemyHealth: enemyHealth, playerName: playerName, playerHealth: playerHealth, onAttack: handleAttack, onDefense: handleDefend)
    }
    
    private func updateUI() {
        battleView.updatePlayerHealth(playerHealth)
        battleView.updatePlayerShield(playerShield)

        battleView.updateEnemyHealth(enemyHealth)
        battleView.updateEnemyShield(enemyShield)
    }
    
    private func handleAttack() {
        enemyHealth -= playerAttackPower
        updateUI()
        
        if enemyHealth <= 0 {
            goToDialogue()
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.takeEnemyTurn()
        }
    }
    
    private func handleDefend() {
        playerShield += 10
        updateUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.takeEnemyTurn()
        }
    }
    
    private func takeEnemyTurn() {
        let damageTaken = max(0, enemyAttackPower - playerShield)
        playerHealth -= damageTaken
        playerShield = 0
        updateUI()
        
        if playerHealth <= 0 {
            showGameOver()
        }
    }
    
    private func showGameOver() {
        let alert = UIAlertController(title: "Game Over", message: "Você perdeu!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func goToDialogue() {
        if let onBattleFinished = onBattleFinished {
            onBattleFinished()
        } else {
            let dialogueVC = DialogueViewController(startNodeId: "start")
            navigationController?.pushViewController(dialogueVC, animated: false)
        }
    }
}
