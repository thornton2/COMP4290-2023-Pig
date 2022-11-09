//
//  GameStatusUpdateProtocol.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

enum StatusUpdateVerbosity: Int {
    case High = 1
    case Medium = 2
    case Low = 3
}


protocol GameStatusUpdateProtocol {

    var verbosity: StatusUpdateVerbosity { get set }
    
    func startTurnForPlayer(_ player: ActivePlayer, againstPlayer opponent: ActivePlayer)
    
    func decisionToPlayByPlayer(_ player: ActivePlayer)
 
    func pigOutByPlayer(_ player: ActivePlayer)
    
    func wonByPlayer(_ player: ActivePlayer)
    
    func diceRoll(_ value: Int, byPlayer player: ActivePlayer)
    
    func tournamentMatchOverForPlayer1(_ player1: TournamentPlayer, andPlayer2 player2: TournamentPlayer)
    
    func tournamentOverForPlayers(_ players: [TournamentPlayer])
}
