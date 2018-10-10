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
    @IBOutlet weak var whiteCardPhrase2Button: BorderedButton!
    @IBOutlet weak var whiteCardPhrase3Button: BorderedButton!
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


// MARK: API Call
extension PlayViewController {
    
    // MARK: API Call Methods
    
    func blackCardsURL() -> URL? {
        let urlString = "http://localhost:3000/blackCards"
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    func whiteCardsURL() -> URL? {
        let urlString = "http://localhost:3000/whiteCards"
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    func performCardRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            showNetworkError()
            return nil
        }
    }
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Uh Oh!", message: "There was an error accessing the CAH API. " + " Please try again", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
