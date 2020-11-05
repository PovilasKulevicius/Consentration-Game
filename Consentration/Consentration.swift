//
//  Consentration.swift
//  Consentration
//
//  Created by Povilas Kulevicius on 2020-11-03.
//

import Foundation

class Consentration
{
    private (set) var cards = [Card]()
    
    private var indexOfFaceUpCard : Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfFaceUpCard = index
            }
        }
    }
    
    func resetGame(){
        cards.shuffle()
        
        for flipDownIndex in cards.indices {
            cards[flipDownIndex].isFaceUp = false
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
