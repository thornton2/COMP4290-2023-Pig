struct OwenWillerPlayer : PlayerProtocol {
  func willPlayToTotalOf(_ goal: Int, withTurnScoreOf turnScore: Int, withPlayerTotal currentTotal: Int, againstOpponentWith opponentTotal: Int) -> Bool{
        if turnScore + currentTotal < ((goal - currentTotal + turnScore) / 4) + opponentTotal {
          return true
      }
        else if goal - turnScore + currentTotal <= 20{
          return true
      }
      return false
  }
}

