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
    @IBOutlet weak var whiteCardPhrase1Button: BorderedButton!
    @IBOutlet weak var whiteCardPhrase2Button: UIButton!
    @IBOutlet weak var whiteCardPhrase3Button: UIButton!
    @IBOutlet weak var pickNumberLabel: UILabel!
    
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
        newRound()
        
        let testButton = BorderedButton()
        testButton.setTitle("test", for: .normal)
        self.view.addSubview(testButton)
    }
    
    // MARK: Methods
    
    func newRound() {
        populateDeck()
        setBlackCardLabel()
        setWhiteCardButtonTitles()
    }
    
    func populateDeck() {
        let deckDatabase = DeckDatabase()
        
        for whiteCard in deckDatabase.whiteCards{
            whiteCards.append(whiteCard)
        }
        
        for blackCard in deckDatabase.blackCards {
            blackCards.append(blackCard)
        }
        
    }
    
    func setBlackCardLabel() {
        guard let blackCard = blackCards.randomElement() else { return }
        blackCardLabel.text = blackCard.text
        setPickNumberLabel(blackCard: blackCard)
    }
    
    func setPickNumberLabel(blackCard: BlackCard) {
        guard let pickNumber = blackCard.pick else { return }
        pickNumberLabel.text = "Choose \(pickNumber)!"
    }
    
    func setWhiteCardButtonTitles() {
        let shuffledWhiteCards = whiteCards.shuffled()
        whiteCard1 = shuffledWhiteCards[0]
        whiteCard2 = shuffledWhiteCards[1]
        whiteCard3 = shuffledWhiteCards[2]
        
        whiteCardPhrase1Button.setTitle(whiteCard1, for: .normal)
        whiteCardPhrase2Button.setTitle(whiteCard2, for: .normal)
        whiteCardPhrase3Button.setTitle(whiteCard3, for: .normal)
    }
    

}
