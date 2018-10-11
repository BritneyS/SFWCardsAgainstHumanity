//
//  BlackCard.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/11/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

struct BlackCard: Decodable {
    var text: String?
    var pick: Int?
    
    init(text: String, pick: Int) {
        self.text = text
        self.pick = pick
    }
}
