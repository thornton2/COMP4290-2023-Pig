//
//  TournamentPlayer.swift
//  MacPig
//
//  Created by Michael Thornton on 1/22/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation


/**
 Tournament player is a player and all the related stats for this player.  We "wrap" PlayerProtol
 to prevent it from having access to the stats.  If a player did have access to thier stats they
 could cheat and modify them.
 */
class TournamentPlayer {
    
    var wins = 0
    var losses = 0
    var matchWins = 0
    var matchLosses = 0
    var player: PlayerProtocol?
    


    init(player: PlayerProtocol) {
        self.player = player
    }
    
    
    func resetGameStats() {
        wins = 0;
        losses = 0;
    }
    
} // end class
