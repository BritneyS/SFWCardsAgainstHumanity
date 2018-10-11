//
//  WhiteCard.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/10/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

//struct WhiteCardSet: Decodable {
//    let whiteCards: [WhiteCard]
//}

struct WhiteCard: Decodable {
    var phrase: [String?] = []
    
    init(from decoder: Decoder) throws {
        var arrayContainer = try decoder.unkeyedContainer()
        while !arrayContainer.isAtEnd {
            let nextPhrase = try arrayContainer.decode(String.self)
            phrase.append(nextPhrase)
        }
    }
}
