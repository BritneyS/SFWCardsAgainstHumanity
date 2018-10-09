//
//  PlayViewController.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/8/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var blackCardLabel: UILabel!
    @IBOutlet weak var whiteCardPhrase1Button: UIButton!
    @IBOutlet weak var whiteCardPhrase2Button: UIButton!
    @IBOutlet weak var whiteCardPhrase3Button: UIButton!
    
    // MARK: Properties
    var whiteCards: [String] = []
    var blackCards: [BlackCard] = []
    
    var blackCard: BlackCard?
    var whiteCard1: String?
    var whiteCard2: String?
    var whiteCard3: String?
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        populateDeck()
        
    }
    
    // MARK: Methods
    
    func populateDeck() {
        let deckDatabase = DeckDatabase()
        
        for whiteCard in deckDatabase.whiteCards {
            whiteCards.append(whiteCard)
        }
        
        for blackCard in deckDatabase.blackCards {
            blackCards.append(blackCard)
        }
    }
    

}
