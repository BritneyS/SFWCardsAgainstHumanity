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
    case playVC
    case favoritesVC
    
    case homeToPlaySegue
    case playToSelectionSegue
    case homeToFavoritesSegue
    
    var storyboardID: String {
        switch self {
        case .homeVC:
            return "HomeViewController"
        case .playVC:
            return "PlayViewController"
        case .favoritesVC:
            return "FavoritesViewController"
        default:
            return ""
        }
    }
    
    var segueID: String {
        switch self {
        case .homeToPlaySegue:
            return "homeToPlay"
        case .playToSelectionSegue:
            return "playToSelection"
        case .homeToFavoritesSegue:
            return "homeToFavorites"
        default:
            return ""
        }
    }
}
