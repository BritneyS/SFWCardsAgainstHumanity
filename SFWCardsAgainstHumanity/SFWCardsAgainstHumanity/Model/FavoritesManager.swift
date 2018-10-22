//
//  FavoritesManager.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/22/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation
// Singleton
final class FavoritesManager {
    
    static let shared = FavoritesManager()
    
    //var favoriteSelection: FavoriteSelection? = nil
    var favoritesList: [FavoriteSelection] = []
    
    private init() {}
    
    func addFavorite(favorite: FavoriteSelection) {
        self.favoritesList.append(favorite)
    }
    
}
