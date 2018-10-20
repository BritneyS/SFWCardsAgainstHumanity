//
//  SelectionViewController.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/17/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var modalSelectionView: UIView!
    @IBOutlet weak var blackCardLabel: UILabel!
    @IBOutlet weak var whiteCardOneLabel: BorderedLabel!
    @IBOutlet weak var whiteCardTwoLabel: BorderedLabel!
    @IBOutlet weak var whiteCardThreeLabel: BorderedLabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    // MARK: Properties
    
    var currentSelection: (blackCard: BlackCard?, whiteCardPhrases: [String?]) = (blackCard: nil, whiteCardPhrases: [])
    var isFavorited = false
    let favoriteImage = UIImage(named: "favorite")?.withRenderingMode(.alwaysOriginal)
    let favoriteFilledImage = UIImage(named: "favorite-filled")?.withRenderingMode(.alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalSelectionView.layer.cornerRadius = 10
        print("🃏In Selection View: \(currentSelection)")
        populateAllLabels()
        resetFavoriteButton()
    }
    
    // MARK: Methods
    
    
    func populateBlackCardLabel(with blackCard: BlackCard) {
        guard let blackCardText = blackCard.text else { return }
        blackCardLabel.text = HTMLDecode.decodeHTMLString(for: blackCardText).string
    }
    
    func hideUnusedWhiteCardLabels(max number: Int) {
        switch number {
        case 1:
            whiteCardTwoLabel.isHidden = true
            whiteCardThreeLabel.isHidden = true
        case 2:
            whiteCardThreeLabel.isHidden = true
        default:
            return
        }
    }
    
    func populateWhiteCardLabels(linkedTo blackCard: BlackCard) {
        let labelArray = [whiteCardOneLabel, whiteCardTwoLabel, whiteCardThreeLabel]
        guard let optionNumber = blackCard.pick else { return }
        hideUnusedWhiteCardLabels(max: optionNumber)

        for (index, label) in labelArray.enumerated() {
            guard let label = label else { return }
            if !label.isHidden {
                labelArray[index]?.text = currentSelection.whiteCardPhrases[index]
            }
        }
    }
    
    func populateAllLabels() {
        guard let blackCard = currentSelection.blackCard else { return }
        populateBlackCardLabel(with: blackCard)
        populateWhiteCardLabels(linkedTo: blackCard)
    }
    
    func resetFavoriteButton() {
        isFavorited = false
        favoriteButton.setImage(favoriteImage, for: .normal)
        favoriteButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func toggleFavoriteButton() {
        
        if !isFavorited {
            isFavorited = true
            favoriteButton.setImage(favoriteFilledImage, for: .normal)
            favoriteButton.imageView?.contentMode = .scaleAspectFit
        } else {
            resetFavoriteButton()
        }
    }

    // MARK: Actions
    
    @IBAction func userTappedDismissButton(_ sender: BorderedButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userTappedFavoriteButton(_ sender: UIButton) {
        toggleFavoriteButton()
    }
    
    

}
