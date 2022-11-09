//
//  CommandLineStatusUpdate.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

class CommandLineStatusUpdate: GameStatusUpdateProtocol {

    var verbosity: StatusUpdateVerbosity = .Low
    
    init(verbosity: StatusUpdateVerbosity) {
        self.verbosity = verbosity
    }
    
    
    
    func startTurnForPlayer(_ player: ActivePlayer, againstPlayer opponent: ActivePlayer) {
        if verbosity == .High || verbosity == .Medium {
            print("\nStart turn for \(player.player) (has \(player.currentTotal) opponent has \(opponent.currentTotal))")
        }
    }
    
    
    
    func decisionToPlayByPlayer(_ player: ActivePlayer) {
        
        if verbosity == .High {
            print("\(player.player) will play (current turn total \(player.turnTotal), current grand total \(player.currentTotal))")
        }
    }
    
    
    
    func pigOutByPlayer(_ player: ActivePlayer) {
        if verbosity == .High {
            print("PIG OUT ----> \(player.player)")
        }
    }
    
    
    
    func wonByPlayer(_ player: ActivePlayer) {
        if verbosity == .High || verbosity == .Medium {
            print("\n\nWinner, winner, piggy dinner")
            print("Congradulations \(player.player)")
        }
    }
    
    
    
    func diceRoll(_ value: Int, byPlayer player: ActivePlayer) {
        
        if verbosity == .High {
            print("\(player.player) rolled \(value)")
        }
    }
    
    
    
    func tournamentMatchOverForPlayer1(_ player1: TournamentPlayer, andPlayer2 player2: TournamentPlayer) {
        
        guard let p1 = player1.player, let p2 = player2.player else {
            assertionFailure("Player is nil for a tournament player in status update call")
            return
        }
        
        print("\nMatch complete between \(p1) and \(p2)")
        print("\(p1) won \(player1.wins)")
        print("\(p2) won \(player2.wins)")
        
    }
    
    
    func tournamentOverForPlayers(_ players: [TournamentPlayer]) {
        
        print("\n\nTournament results")
        
        for tournamentPlayer in players {
            
            if let player = tournamentPlayer.player {
                print("\(player) wins : \(tournamentPlayer.matchWins) losses : \(tournamentPlayer.matchLosses)")
            }
        }
    }
}
