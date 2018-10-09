//
//  DeckDatabase.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/9/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

struct DeckDatabase {
    let blackCards = [
//        [
//            "What's that smell?",
//            1
//        ],
//        [
//            "_ is a slippery slope that leads to _.",
//            2
//        ],
//        [
//            "I set up script to buy things on ebay for $1, but then it bought _, _, and _.",
//            3
//        ]
        
        BlackCard(text: "What's that smell?", pick: 1),
        BlackCard(text: "_ is a slippery slope that leads to _.", pick: 2),
        BlackCard(text: "I set up script to buy things on ebay for $1, but then it bought _, _, and _.", pick: 3)
    ]
    
    let whiteCards = [
        "Sharing needles.",
        "Friction.",
        "A mime having a stroke.",
        "A hot mess.",
        "Adderall&trade;.",
        "A windmill full of corpses."
    ]
}
