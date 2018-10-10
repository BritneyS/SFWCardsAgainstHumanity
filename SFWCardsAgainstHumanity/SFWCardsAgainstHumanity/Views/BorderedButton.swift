//
//  BorderedButton.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/10/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation
import UIKit

class BorderedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.borderColor = tintColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    

    override func tintColorDidChange() {
        super.tintColorDidChange()
        
        layer.borderColor = tintColor.cgColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            let fadedColor = tintColor.withAlphaComponent(0.2).cgColor
            
            if isHighlighted {
                layer.borderColor = fadedColor
            } else {
                layer.borderColor = tintColor.cgColor
                
                let animation = CABasicAnimation(keyPath: "borderColor")
                animation.fromValue = fadedColor
                animation.toValue = tintColor.cgColor
                animation.duration = 0.4
                layer.add(animation, forKey: "")
            }
        }
    }
}
