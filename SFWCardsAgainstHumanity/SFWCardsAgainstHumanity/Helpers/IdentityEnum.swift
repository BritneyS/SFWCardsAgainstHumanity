//
//  IdentityEnum.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/8/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation

enum Identity: String {
    case homeVC
    
    case segueIDToChange
    
    var storyboardID: String {
        switch self {
        case .homeVC:
            return "HomeViewController"
        default:
            return ""
        }
    }
    
    var segueID: String {
        switch self {
        case .segueIDToChange:
            return ""
        default:
            return ""
        }
    }
}
