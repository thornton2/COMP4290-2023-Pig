//
//  main.swift
//  MacPig
//
//  Created by Michael Thornton on 1/16/19.
//  Copyright © 2019 Michael Thornton. All rights reserved.
//

import Foundation

print("Pig death match!\n\n")


//updates are reported via an instance of an object that implements the GameStatusUpdateProtocol
//for this app, our implementation outputs to the command line
TournamentManager.instance.statusUpdate = CommandLineStatusUpdate(verbosity: .High)

//add the players
TournamentManager.instance.addPlayer(player: PlayerHoldFixed())
TournamentManager.instance.addPlayer(player: PlayerRandom())

//fight to the death
//the number of rounds is a bit misleading
//each player plays each other double the number of rounds
//this is so each get to go first the same number of times
//so if we run the tournament for 10 games, p1 would play p1 20 times
//10 times p1 goes first, 10 times p2 goes first
TournamentManager.instance.playRoundRobin(1000)
