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
    
    
    // MARK: Properties
    
    var currentSelection: (blackCard: BlackCard?, whiteCardPhrases: [String?]) = (blackCard: nil, whiteCardPhrases: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("🃏In Selection View: \(currentSelection)")
        populateBlackCardLabel()
        populateWhiteCardLabels(with: currentSelection.blackCard!)
    }
    
    // MARK: Methods
    
    func populateBlackCardLabel() {
        guard let blackCard = currentSelection.blackCard else { return }
        blackCardLabel.text = blackCard.text
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
    
    func populateWhiteCardLabels(with blackCard: BlackCard) {
        let labelArray = [whiteCardOneLabel, whiteCardTwoLabel, whiteCardThreeLabel]
        let optionNumber = blackCard.pick
        hideUnusedWhiteCardLabels(max: optionNumber!)

        for (index, label) in labelArray.enumerated() {
            if label!.isHidden == false {
                labelArray[index]?.text = currentSelection.whiteCardPhrases[index]
            }
        }
    }


}
