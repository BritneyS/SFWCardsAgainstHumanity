//
//  FavoriteSelection.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/22/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

class FavoriteSelection: Equatable {
    
    var blackCard: BlackCard?
    var whiteCardPhrases: [String?]
    var isFavorited: Bool
    
    static func == (lhs: FavoriteSelection, rhs: FavoriteSelection) -> Bool {
        return (lhs.blackCard == rhs.blackCard) && (lhs.whiteCardPhrases == rhs.whiteCardPhrases) && (lhs.isFavorited == rhs.isFavorited)
    }
    
    init(blackCard: BlackCard?, whiteCardPhrases: [String?], isFavorited: Bool) {
        self.blackCard = blackCard
        self.whiteCardPhrases = whiteCardPhrases
        self.isFavorited = isFavorited
    }
}
