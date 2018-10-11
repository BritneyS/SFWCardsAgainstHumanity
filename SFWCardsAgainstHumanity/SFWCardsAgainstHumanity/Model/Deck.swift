//
//  Deck.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/9/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Deck {
    var whiteCards: [WhiteCards]?
    var blackCards: [BlackCard]?
    
    init(whiteCards: [WhiteCards], blackCards: [BlackCard]) {
        self.whiteCards = whiteCards
        self.blackCards = blackCards
    }
}

