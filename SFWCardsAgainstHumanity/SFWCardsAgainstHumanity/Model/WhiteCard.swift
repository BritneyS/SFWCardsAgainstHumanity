//
//  WhiteCard.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/10/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

struct WhiteCard: Decodable {
    let phrase: [String]
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        phrase = try container.decode([String].self)
    }
}
