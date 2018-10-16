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
    
    override var isSelected: Bool {
        didSet {
            let fadedColor = tintColor.withAlphaComponent(0.2).cgColor
            let highlightedColor = UIColor(red:1.00, green:0.05, blue:0.48, alpha:1.0)
            //To get rid of the tint background upon selection
            self.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.0)
            if isSelected {
                layer.borderColor = UIColor.black.cgColor
                self.backgroundColor = highlightedColor
                self.setTitleColor(UIColor.white, for: .normal)
                self.isEnabled = false
            } else {
                layer.borderColor = tintColor.cgColor
                
                let animation = CABasicAnimation(keyPath: "borderColor")
                animation.fromValue = fadedColor
                animation.toValue = UIColor.black.cgColor
                animation.duration = 0.4
                layer.add(animation, forKey: "")
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            let fadedColor = tintColor.withAlphaComponent(0.2).cgColor
            let highlightedColor = UIColor(red:1.00, green:0.05, blue:0.48, alpha:1.0).cgColor
            
            if isHighlighted {
                layer.borderColor = UIColor.black.cgColor
                layer.backgroundColor = highlightedColor
                self.setTitleColor(UIColor.white, for: .normal)
            } else {
                layer.borderColor = UIColor.black.cgColor
                
                let animation = CABasicAnimation(keyPath: "borderColor")
                animation.fromValue = fadedColor
                animation.toValue = UIColor.black.cgColor
                animation.duration = 0.4
                layer.add(animation, forKey: "")
            }
        }
    }
}
