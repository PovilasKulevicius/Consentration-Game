//
//  Card.swift
//  Consentration
//
//  Created by Povilas Kulevicius on 2020-11-03.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var idenfierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        idenfierFactory += 1
        return idenfierFactory;
    }
    
    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
