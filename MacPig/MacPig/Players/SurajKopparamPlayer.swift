
import Foundation

class SurajKopparamPlayer: PlayerProtocol {
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: 
    Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        var pointsForOpponentWin = goal- opponentTotal
        var pointsToWin = goal- currentTotal
        var difference = (currentTotal - opponentTotal)
        if pointsForOpponentWin<= 17 && turnScore< 35 { // hillmary
            return true;
        }else if(pointsToWin<15 && abs(difference)<15){ //hillmary
            return true;
        }else if(difference>25 && turnScore<12){ //bait them to play risky
            return true;
        }        
        if(turnScore<=15){ //defaul speed
            return true;
        }else{
            return false;
        }
    }
}
// default roll to 15 and save
//unless they are winning by more than 35 points then roll to 20.
//


extension SurajKopparamPlayer: CustomStringConvertible {
    
    var description: String {
        return "Suraj Kopparam"
    }
    
} // end extension
