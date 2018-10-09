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
    
    var deck: Deck?
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
        setBlackCardLabel()
        setWhiteCardButtonTitles()
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
    
    func setBlackCardLabel() {
        blackCard = blackCards.randomElement()
        blackCardLabel.text = blackCard?.text
    }
    
    func setWhiteCardButtonTitles() {
        whiteCard1 = whiteCards.randomElement()
        whiteCard2 = whiteCards.randomElement()
        whiteCard3 = whiteCards.randomElement()
        
        /// TODO: pop/disqualify random element to prevent re-use in same method
        
        whiteCardPhrase1Button.setTitle(whiteCard1, for: .normal)
        whiteCardPhrase2Button.setTitle(whiteCard2, for: .normal)
        whiteCardPhrase3Button.setTitle(whiteCard3, for: .normal)
    }
    

}
