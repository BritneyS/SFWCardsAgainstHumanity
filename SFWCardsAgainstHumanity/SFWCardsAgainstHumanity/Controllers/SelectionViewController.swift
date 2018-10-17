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
    }
    


}
