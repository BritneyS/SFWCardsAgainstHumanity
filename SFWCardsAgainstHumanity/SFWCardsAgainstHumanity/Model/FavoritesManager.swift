//
//  FavoritesManager.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/22/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import Foundation
/// Singleton
final class FavoritesManager {
    
    static let shared = FavoritesManager()
    
    var favoritesList: [FavoriteSelection] = []
    
    private init() {}
    
    func addFavorite(favorite: FavoriteSelection) {
        self.favoritesList.append(favorite)
        for favorite in favoritesList {
            print("🃏FavoritesList: \(favorite.blackCard!)")
        }
    }
    
    func deleteFavorite(favorite: FavoriteSelection) {
        print("🤷‍♀️ Before deletion...")
        guard let index = favoritesList.firstIndex(where: { $0.blackCard == favorite.blackCard && $0.whiteCardPhrases == favorite.whiteCardPhrases }) else {
            print("Start index is \(favoritesList.firstIndex(where: { $0.blackCard == favorite.blackCard && $0.whiteCardPhrases == favorite.whiteCardPhrases })!)")
            print("🤭 No index!!")
            return
        }
        print("🚨Object to be removed: \(favoritesList[index].blackCard!)")
        self.favoritesList.remove(at: index)
    }
}
