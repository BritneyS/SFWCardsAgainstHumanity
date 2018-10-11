//
//  WhiteCard.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/10/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation


struct WhiteCards: Decodable {
    
    var phrases: [String?] = []
    
    init(from decoder: Decoder) throws {
        var arrayContainer = try decoder.unkeyedContainer()
        while !arrayContainer.isAtEnd {
            let nextPhrase = try arrayContainer.decode(String.self)
            phrases.append(nextPhrase)
        }
    }
}

