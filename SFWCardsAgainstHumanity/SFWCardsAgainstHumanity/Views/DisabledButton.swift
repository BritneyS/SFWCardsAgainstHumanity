//
//  DisabledButton.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/15/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation
import UIKit

/*
 let fadedColor = tintColor.withAlphaComponent(0.2).cgColor
 
 if isHighlighted {
 layer.borderColor = fadedColor
 } else {
 layer.borderColor = tintColor.cgColor
 
 */

class DisabledButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
//        self.layer.borderColor = tintColor.cgColor
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 5
//        contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    override var isEnabled: Bool {
        didSet {
            if !isEnabled {
                let fadedColor = UIColor.black.withAlphaComponent(0.5)
                self.backgroundColor = fadedColor
            } else {
                //self.backgroundColor = backgroundColor
            }
        }
    }
}
