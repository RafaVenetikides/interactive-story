//
//  BattleViewController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 29/07/25.
//

import UIKit

class BattleViewController: UIViewController {
    
    private let battleView = BattleView()
    
    private var player = Character(name: "Player", totalHealth: 100, currentHealth: 100, shield: 0, attackPower: 10)
    
    private var enemy = Character(name: "Talking Cricket", totalHealth: 20, currentHealth: 20, shield: 0, attackPower: 5, image: "cricket")
    
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
        battleView.updatePlayerHealth(currentHealth: player.currentHealth, totalHealth: player.totalHealth)
        battleView.updatePlayerShield(player.shield)
        battleView.updatePlayerHealthBar(current: player.currentHealth, total: player.totalHealth)

        battleView.updateEnemyHealth(currentHealth: enemy.currentHealth, totalHealth: enemy.totalHealth)
        battleView.updateEnemyShield(enemy.shield)
        battleView.updateEnemyHealthBar(current: enemy.currentHealth, total: enemy.totalHealth)
    }
    
    private func handleAttack() {
        guard isPlayerTurn else { return }
        enemy.currentHealth -= player.attackPower
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
        var damageTaken = enemy.attackPower
        if player.shield > 0 {
            let shieldDamage = damageTaken
            damageTaken -= player.shield
            player.shield -= shieldDamage
        }
        player.currentHealth -= max(0, damageTaken)
        player.shield = 0
        isPlayerTurn = true
        updateUI()
        
        if player.currentHealth <= 0 {
            showGameOver()
        }
    }
    
    private func checkBattleState() {
        if enemy.currentHealth <= 0 {
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
