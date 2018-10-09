//
//  Deck.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/9/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Deck {
    var whiteCards: [String]?
    var blackCards: BlackCard?
    
    init(whiteCards: [String], blackCards: BlackCard) {
        self.whiteCards = whiteCards
        self.blackCards = blackCards
    }
}

class BlackCard {
    var text: String?
    var pick: Int?
    
    init(text: String, pick: Int) {
        self.text = text
        self.pick = pick
    }
}

