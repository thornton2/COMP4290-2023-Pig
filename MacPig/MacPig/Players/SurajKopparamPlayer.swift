
import Foundation

class SurajKopparamPlayer: PlayerProtocol {
    
    func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: 
    Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool {
        
        return (Int.random(in: 1...2) == 1) // return true to roll again.
    }
}


extension SurajKopparamPlayer: CustomStringConvertible {
    
    var description: String {
        return "Suraj Kopparam"
    }
    
} // end extension
