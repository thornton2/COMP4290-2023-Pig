//
//  JohnKneicePlayer.swift
//  MacPig
//
//  Created by Jonathan Kneice on 1/23/23.
//  Copyright © 2023 Michael Thornton. All rights reserved.
//

import Foundation

class JohnKneicePlayer: PlayerProtocol {
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        if currentTotal + turnScore<opponentTotal{
            return true
        }
        else if turnScore<10{
            return true
        }
        else{
            return false
        }
        
    }
}
extension JohnKneicePlayer: CustomStringConvertible {
    
    var description: String {
        return "Johnathan Kneice"
    }
    
} // end extension
