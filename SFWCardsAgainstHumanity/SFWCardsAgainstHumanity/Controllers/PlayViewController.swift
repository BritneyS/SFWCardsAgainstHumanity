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
    
    
    var whiteCardsJSON: WhiteCards? = nil
    var blackCardsJSON: [BlackCard] = []
    var blackCard: BlackCard?
    var whiteCard1: String?
    var whiteCard2: String?
    var whiteCard3: String?
    var isLoading = false
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    // MARK: Methods
    
    func getCardData() {
        
        guard let whiteCardUrl = self.whiteCardsURL() else { return }
        guard let blackCardUrl = self.blackCardsURL() else { return }
//        guard let jsonStringWhiteCard = performCardRequest(with: whiteCardUrl) else { return }
//        guard let jsonStringBlackCard = performCardRequest(with: blackCardUrl) else { return }
//
//        self.whiteCardsJSON = parseWhiteCard(data: jsonStringWhiteCard) ?? nil
//        self.blackCardsJSON = parseBlackCard(data: jsonStringBlackCard) ?? []
//
//        print("White Cards: \(whiteCardsJSON!)")
//
//        for card in blackCardsJSON {
//            print("Black Cards: \(card.text!)")
        let session = URLSession.shared
        
        let whiteCardDataTask = session.dataTask(with: whiteCardUrl, completionHandler: {
            data, response, error in
            if let error = error {
                print("Failure in data task! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Successful response! \(data!)")
                if let data = data {
                    self.whiteCardsJSON = self.parseWhiteCard(data: data) ?? nil
                    print("White Card JSON parsed: \(self.whiteCardsJSON)")
                    DispatchQueue.main.async {
                        self.isLoading = false
                        //self.view.reloadInputViews()
                    }
                }
                
                return
            } else {
                print("Failure in response! \(response!)")
            }
            DispatchQueue.main.async {
                self.isLoading = false
                //self.view.reloadInputViews()
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
                    print("Black Card JSON parsed: \(self.blackCardsJSON)")
                    DispatchQueue.main.async {
                        self.isLoading = false
                        //self.view.reloadInputViews()
                    }
                }
                
                return
            } else {
                print("Failure in response! \(response!)")
            }
            DispatchQueue.main.async {
                self.isLoading = false
                //self.view.reloadInputViews()
                self.showNetworkError()
            }
        })
        blackCardDataTask.resume()
    }
    
    func newRound() {
        getCardData()
        checkBlackCard()
        setWhiteCardButtonTitles()
    }
    
    func isBlackCardTextEmpty(in blackCard: BlackCard) -> Bool {
        if (blackCard.text?.isEmpty)! {
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
            setBlackCardLabel(for: blackCard)
        } else {
            checkBlackCard()
        }
    }
    
    func setBlackCardLabel(for blackCard: BlackCard) {
        blackCardLabel.text = blackCard.text
        setPickNumberLabel(blackCard: blackCard)
    }
    
    func setPickNumberLabel(blackCard: BlackCard) {
        guard let pickNumber = blackCard.pick else { return }
        pickNumberLabel.text = "Choose \(pickNumber)!"
    }
    
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
    
}
