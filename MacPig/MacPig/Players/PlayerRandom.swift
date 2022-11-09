//
//  PlayerRandom.swift
//  MacPig
//
//  Created by Michael Thornton on 1/22/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

class PlayerRandom: PlayerProtocol {
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        
        return (Int.random(in: 1...2) == 1)
    }
}


extension PlayerRandom: CustomStringConvertible {
    
    var description: String {
        return "Random Randy"
    }
    
} // end extension
