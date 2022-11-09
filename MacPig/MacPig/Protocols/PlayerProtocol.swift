//
//  PlayerProtocol.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

protocol PlayerProtocol {
    
    /**
     Called repeatedly on the players turn until either the player pigs out
     of the player passes
     
     - Parameters:
       - goal: The total that will win the game
       - turnScore: The total players has this turn
       - currentTotal: The player total score NOT counting this turn's total
       - opponentTotal: The opponents total score
     */
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool
    
} // end protocol
