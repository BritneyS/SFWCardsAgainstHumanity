//
//  BlackCard.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/11/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

//struct BlackCardDeck: Decodable {
//    let blackCards: [BlackCard]
//}

struct BlackCard: Decodable {
    let text: String?
    let pick: Int?
    
//    enum CodingKeys: CodingKey {
//        case text
//        case pick
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.text = try container.decodeIfPresent(String.self, forKey: .text)
//        self.pick = try container.decodeIfPresent(Int.self, forKey: .pick)
//
//    }
}
