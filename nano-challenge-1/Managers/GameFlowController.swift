//
//  GameFlowController.swift
//  nano-challenge-1
//
//  Created by Rafael Venetikides on 01/08/25.
//

import UIKit

class GameFlowController {
    let navigationController: UINavigationController
    let eventManager: EventManager
    
    init(navigationController: UINavigationController, eventManager: EventManager) {
        self.navigationController = navigationController
        self.eventManager = eventManager
    }
    
    func startGame() {
        showCurrentEvent()
    }
    
    func showCurrentEvent() {
        guard let event = eventManager.getCurrentEvent() else { return }
        
        switch event.type {
        case .dialogue(let node):
            let vc = DialogueViewController(dialogueNode: node)
            vc.onOptionSelected = { [weak self] selectedOption in
                guard let nextId = selectedOption.nextEventId, let self else { return }
                
                self.eventManager.goToEventId(nextId)
                self.showCurrentEvent()
            }
            self.navigationController.pushViewController(vc, animated: false)
        case .battle(let character):
            let vc = BattleViewController(enemy: character)
            vc.onBattleFinished = { [weak self] didWin in
                if didWin {
                    self?.eventManager.goToNextEvent()
                } else {
                    self?.eventManager.reset()
                    self?.navigationController.popViewController(animated: false)
                }
                self?.showCurrentEvent()
            }
            
            self.navigationController.pushViewController(vc, animated: false)
        }
    }
}
