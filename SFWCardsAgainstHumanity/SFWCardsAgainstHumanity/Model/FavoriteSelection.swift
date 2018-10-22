//
//  FavoriteSelection.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/22/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class FavoriteSelection {
    var blackCard: BlackCard?
    var whiteCardPhrases: [String?]
    var isFavorited: Bool
    
    init(blackCard: BlackCard?, whiteCardPhrases: [String?], isFavorited: Bool) {
        self.blackCard = blackCard
        self.whiteCardPhrases = whiteCardPhrases
        self.isFavorited = isFavorited
    }
}
