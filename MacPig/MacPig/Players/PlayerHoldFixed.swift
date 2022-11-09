//
//  PlayerHoldFixed.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation


class PlayerHoldFixed: PlayerProtocol {
    
    var holdCap = 20
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        
        if currentTotal + turnScore > goal {
            return false
        }
        
        return turnScore <= holdCap
    }
    
} // end class



extension PlayerHoldFixed: CustomStringConvertible {
    
    var description: String {
        return "Fixed 20"
    }
    
} // end extension
