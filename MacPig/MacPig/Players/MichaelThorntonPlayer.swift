//
//  MichaelThorntonPlayer.swift
//  MacPig
//
//  Created by Michael Thornton on 11/9/22.
//  Copyright © 2022 Michael Thornton. All rights reserved.
//

import Foundation


class MichaelThorntonPlayer : PlayerProtocol {
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        
        return currentTotal + turnScore <= opponentTotal
    }
    
} // end class



extension MichaelThorntonPlayer: CustomStringConvertible {
    
    var description: String {
        return "Michael Thornton"
    }
    
} // end extension
