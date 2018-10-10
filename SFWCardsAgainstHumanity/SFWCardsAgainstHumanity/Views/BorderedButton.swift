//
//  BorderedButton.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/10/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

/*
 class CustomButton: UIButton {
 
 var myValue: Int
 
 override init(frame: CGRect) {
 // set myValue before super.init is called
 self.myValue = 0
 
 super.init(frame: frame)
 
 // set other operations after super.init, if required
 backgroundColor = .red
 }
 
 required init?(coder aDecoder: NSCoder) {
 // set myValue before super.init is called
 self.myValue = 0
 
 super.init(coder: aDecoder)
 
 // set other operations after super.init if required
 backgroundColor = .red
 }
 
 }

 */

import Foundation
import UIKit

class BorderedButton: UIButton {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        self.layer.borderColor = tintColor.cgColor
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 5
//
//        contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
//        print("bordered button initialized")
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("bordered button initialized")
        //fatalError("init(coder:) has not been implemented")
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
