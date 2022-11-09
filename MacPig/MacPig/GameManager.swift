//
//  GameManager.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

/**
 * Facilitates one game of pig between two players.
 */
class GameManager {
    
    static let instance = GameManager()
    
    //All output from the GameManager is raised as calls to this update interface.
    var statusUpdate: GameStatusUpdateProtocol?
    
    var goalScore = 100
    var sidesOfDice = 6

    let PIGOUT = 1
    
    
    /**
     * Private constructor to enfore the singleton pattern
     */
    private init() { }
    
    
    /**
     Plays a game between two supplied players.
     
     - Parameter
        - player1: first player
        - player2: second player
     */
    func playGameWithPlayer1(_ player1: PlayerProtocol, andPlayer2 player2: PlayerProtocol) -> PlayerProtocol {
        
        let p1 = ActivePlayer(player: player1, goalScore: goalScore)
        let p2 = ActivePlayer(player: player2, goalScore: goalScore)
        
        var turn = 0;
        
        
        while !p1.isWinner() && !p2.isWinner() {
            
            statusUpdate?.startTurnForPlayer(p1, againstPlayer: p2)
            
            playWithPlayer(p1, againstOpponent: p2)
            
            if !p1.isWinner() {
                statusUpdate?.startTurnForPlayer(p2, againstPlayer: p1)
                playWithPlayer(p2, againstOpponent: p1)
            }
            
            turn += 1
        }
        
        if p1.isWinner() {
            statusUpdate?.wonByPlayer(p1)
            return player1
        }
        else {
            statusUpdate?.wonByPlayer(p1)
            return player2
        }
    }
    
    
    
    func playWithPlayer(_ player: ActivePlayer, againstOpponent opponent: ActivePlayer) {
    
        while player.willPlayAgainstTotal(opponent.currentTotal) {
            
            statusUpdate?.decisionToPlayByPlayer(player)
                        
            //player rolls the dice
            let diceValue = Int.random(in: 1 ... sidesOfDice)

            statusUpdate?.diceRoll(diceValue, byPlayer: player)
            
            if diceValue == PIGOUT {

                statusUpdate?.pigOutByPlayer(player)
                
                player.pigOut()
                return
            }
            else {
                player.turnTotal += diceValue
            }
        }
        
        player.settleTurn()
    }
    
} // end class
