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
    
    // MARK: Properties
    
    var currentSelection: (blackCard: BlackCard?, whiteCardPhrases: [String?]) = (blackCard: nil, whiteCardPhrases: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(currentSelection)
    }
    


}
