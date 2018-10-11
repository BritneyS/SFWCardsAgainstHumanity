//
//  Deck.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/9/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class Deck {
    var whiteCards: [WhiteCard]?
    var blackCards: [BlackCard]?
    
    init(whiteCards: [WhiteCard], blackCards: [BlackCard]) {
        self.whiteCards = whiteCards
        self.blackCards = blackCards
    }
}

