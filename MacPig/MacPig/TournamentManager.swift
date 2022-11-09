//
//  TournamentManager.swift
//  MacPig
//
//  Created by Michael Thornton on 1/22/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation


class TournamentManager {
    
    static let instance = TournamentManager()
    
    //array or tournament players
    //note the I initialize it, this guarentees the players var will not be nil
    var players = [TournamentPlayer]()

    
    var statusUpdate: GameStatusUpdateProtocol? {
        //didSet is a function you can associate with a property that will get called after the property is assigned
        //it is handy in this case because I want the GameManager to use the same statusUpdate object as the tournament manager
        //using this function guarentees I keep them both in synch
        didSet {
            GameManager.instance.statusUpdate = statusUpdate
        }
    }
    
    
    //private constructor prevents anybody from creating thier own instance
    private init() {}
    
    
    /**
     Takes a player, creates a tournament player, then add them to the list of players in the tournament
     See the TournamentPlayer class to understand why we wrap the PlayerProtocol
     */
    func addPlayer(player: PlayerProtocol) {
        
        let tournamentPlayer = TournamentPlayer(player: player)
        
        players.append(tournamentPlayer)
    }

    
    
    /**
     Everybody plays everybody else.
     */
    func playRoundRobin(_ rounds: Int) {
    
        for p1 in 0..<players.count {
            for p2 in p1+1..<players.count {
                
                resetGameStats()
                playMatchWithPlayer1(players[p1], andPlayer2: players[p2], forNumberOfGames: rounds)
            }
        }
        
        statusUpdate?.tournamentOverForPlayers(players)
    }
    
    
    
    /**
     Ressets the game stats for all players.
     Note - the tournament stats are not reset.
     */
    private func resetGameStats() {
        
        for player in players {
            player.resetGameStats()
        }
    }
    
    
    
    private func playMatchWithPlayer1(_ tournamentPlayer1: TournamentPlayer, andPlayer2 tournamentPlayer2: TournamentPlayer, forNumberOfGames gameCount: Int) {
    
        guard let player1 = tournamentPlayer1.player, let player2 = tournamentPlayer2.player else {
            assertionFailure("Tried to access a nil player in a tournament player.  This should never happen")
            return
        }
        
        for _ in 0..<gameCount {
            
            let winner = GameManager.instance.playGameWithPlayer1(player1, andPlayer2: player2)
            if "\(winner)" == "\(player1)" {
                tournamentPlayer1.wins += 1
                tournamentPlayer2.losses += 1
            }
            else {
                tournamentPlayer1.losses += 1
                tournamentPlayer2.wins += 1
            }
            
            let winner2 = GameManager.instance.playGameWithPlayer1(player2, andPlayer2: player1)
            if "\(winner2)" == "\(player1)" {
                tournamentPlayer1.wins += 1
                tournamentPlayer2.losses += 1
            }
            else {
                tournamentPlayer1.losses += 1
                tournamentPlayer2.wins += 1
            }
        }
        
        if tournamentPlayer1.wins > tournamentPlayer2.wins {
            tournamentPlayer1.matchWins += 1
            tournamentPlayer2.matchLosses += 1
        }
        else {
            tournamentPlayer1.matchLosses += 1
            tournamentPlayer2.matchWins += 1
        }
        
        statusUpdate?.tournamentMatchOverForPlayer1(tournamentPlayer1, andPlayer2: tournamentPlayer2)
    }
    
    
} // end class
