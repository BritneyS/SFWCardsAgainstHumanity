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
    @IBOutlet weak var seeSelectionButton: UIButton!
    
    
    // MARK: Properties
    
    var whiteCardsJSON: WhiteCards? = nil
    var blackCardsJSON: [BlackCard] = []
    var blackCard: BlackCard?
    var whiteCard1: String?
    var whiteCard2: String?
    var whiteCard3: String?
    var isLoading = false
    var selection: (blackCard: BlackCard?, whiteCardPhrases: [String?]) = (blackCard: nil, whiteCardPhrases: [])
    var selectionLimit = 0
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleEnabledButtonState(for: seeSelectionButton)
        getCardData()
    }
    
    // MARK: Methods
    
    func setWhiteCardButtonTitles() {
        guard let whiteCardPhrases = whiteCardsJSON?.phrases else { return }
        let shuffledWhiteCards = whiteCardPhrases.shuffled()
        
        whiteCard1 = shuffledWhiteCards[0]
        whiteCard2 = shuffledWhiteCards[1]
        whiteCard3 = shuffledWhiteCards[2]
        
        whiteCardPhrase1Button.setTitle(whiteCard1, for: .normal)
        whiteCardPhrase2Button.setTitle(whiteCard2, for: .normal)
        whiteCardPhrase3Button.setTitle(whiteCard3, for: .normal)
    }
    
    func isBlackCardTextEmpty(in blackCard: BlackCard) -> Bool {
        guard let blackCardText = blackCard.text else { return false }
        if blackCardText.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func chooseRandomBlackCard() -> BlackCard? {
        guard let blackCard = blackCardsJSON.randomElement() else { return nil }
        return blackCard
    }
    
    func checkBlackCard() {
        guard let blackCard = chooseRandomBlackCard() else { return }
        if !isBlackCardTextEmpty(in: blackCard) {
            saveBlackCardSelection(of: blackCard)
            setBlackCardLabel(for: blackCard)
        } else {
            checkBlackCard()
        }
    }
    
    func saveBlackCardSelection(of blackCard: BlackCard) {
        selection.blackCard = blackCard
    }
    
    func setSelectionLimit(to pickNumber: Int) {
        selectionLimit = pickNumber
    }
    
    func reduceSelectionLimit() {
        self.selectionLimit -= 1
    }
    
    func updatePickNumberLabel() {
        pickNumberLabel.text = "Choose \(self.selectionLimit)!"
    }
    
    func clearPickNumberLabel() {
        pickNumberLabel.text = ""
    }
    
    func setPickNumberLabel(blackCard: BlackCard) {
        guard let pickNumber = blackCard.pick else { return }
        setSelectionLimit(to: pickNumber)
        updatePickNumberLabel()
    }
    
    func setBlackCardLabel(for blackCard: BlackCard) {
        blackCardLabel.text = blackCard.text
        setPickNumberLabel(blackCard: blackCard)
    }
    
    func toggleEnabledButtonState(for button: UIButton) {
        button.isEnabled = !button.isEnabled
        toggleDisabledButtonStyling(for: button)
    }
    
    func toggleDisabledButtonStyling(for button: UIButton) {
        if !button.isEnabled {
            button.alpha = 0.5
        } else {
            button.alpha = 1.0
        }
    }
    
    func disableOtherOptions() {
        let buttonArray = [whiteCardPhrase1Button, whiteCardPhrase2Button, whiteCardPhrase3Button]
        
        for button in buttonArray {
            guard let button = button else { return }
            print("🦊 button selected state of \(button.currentTitle!): \(button.isSelected)")
            if button.isSelected == false {
                toggleEnabledButtonState(for: button)
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func userTappedPhraseButton(_ sender: BorderedButton) {
        let button = sender
        guard let phrase = button.currentTitle else { return }
        if selectionLimit > 0 {
            button.isSelected = true
            selection.whiteCardPhrases.append(phrase)
            reduceSelectionLimit()
            updatePickNumberLabel()
            if selectionLimit == 0 {
                clearPickNumberLabel()
                toggleEnabledButtonState(for: seeSelectionButton)
                disableOtherOptions()
            }
        } else {
            print("No more choices!")
        }
        print(selection)
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
    
    func showNetworkError() {
        let alert = UIAlertController(title: "Uh Oh!", message: "There was an error accessing the CAH API. " + " Please try again", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /// Loads JSON data into app model White Card
    func parseWhiteCard(data: Data) -> WhiteCards? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(WhiteCards.self, from: data)
            return result
        } catch {
            print("JSON Error \(error)")
            return nil
        }
    }
    
    /// Loads JSON data into app model Black Card
    func parseBlackCard(data: Data) -> [BlackCard]? {
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([BlackCard].self, from: data)
            return result
        } catch {
            print("JSON Error \(error)")
            return nil
        }
    }
    
    func getCardData() {
        
        guard let whiteCardUrl = self.whiteCardsURL() else { return }
        guard let blackCardUrl = self.blackCardsURL() else { return }
        
        let session = URLSession.shared
        
        let whiteCardDataTask = session.dataTask(with: whiteCardUrl, completionHandler: {
            data, response, error in
            if let error = error {
                print("Failure in data task! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Successful response! \(data!)")
                if let data = data {
                    self.whiteCardsJSON = self.parseWhiteCard(data: data) ?? nil
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.setWhiteCardButtonTitles()
                    }
                }
                return
            } else {
                print("Failure in response! \(response!)")
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.showNetworkError()
            }
        })
        whiteCardDataTask.resume()
        
        let blackCardDataTask = session.dataTask(with: blackCardUrl, completionHandler: {
            data, response, error in
            if let error = error {
                print("Failure in data task! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Successful response! \(data!)")
                if let data = data {
                    self.blackCardsJSON = self.parseBlackCard(data: data) ?? []
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.checkBlackCard()
                    }
                }
                return
            } else {
                print("Failure in response! \(response!)")
            }
            DispatchQueue.main.async {
                self.isLoading = false
                self.showNetworkError()
            }
        })
        blackCardDataTask.resume()
        
    }
    
}
