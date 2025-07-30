//
//  BattleViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class BattleViewController: UIViewController {
    
    private let battleView = BattleView()
    
    private var player = Character(name: "Player", health: 100, shield: 0, attackPower: 10)
    
    private var enemy = Character(name: "Enemy", health: 10, shield: 0, attackPower: 5)
    
    var onBattleFinished: (() -> Void)?
    private var isPlayerTurn = true
    
    override func loadView() {
        navigationItem.hidesBackButton = true
        self.view = battleView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isPlayerTurn = true
        battleView.configure(
            enemy: enemy,
            player: player,
            onAttack: handleAttack,
            onDefense: handleDefend
        )
    }
    
    private func updateUI() {
        battleView.updatePlayerHealth(player.health)
        battleView.updatePlayerShield(player.shield)

        battleView.updateEnemyHealth(enemy.health)
        battleView.updateEnemyShield(enemy.shield)
    }
    
    private func handleAttack() {
        guard isPlayerTurn else { return }
        enemy.health -= player.attackPower
        updateUI()
        isPlayerTurn = false
        
        checkBattleState()
    }
    
    private func handleDefend() {
        guard isPlayerTurn else { return }
        player.shield += 10
        updateUI()
        isPlayerTurn = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.takeEnemyTurn()
        }
    }
    
    private func takeEnemyTurn() {
        let damageTaken = max(0, enemy.attackPower - player.shield)
        player.health -= damageTaken
        player.shield = 0
        isPlayerTurn = true
        updateUI()
        
        if player.health <= 0 {
            showGameOver()
        }
    }
    
    private func checkBattleState() {
        if enemy.health <= 0 {
            goToDialogue()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.takeEnemyTurn()
            }
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
