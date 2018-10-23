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
        saveFavorites()
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
        saveFavorites()
    }
}

// MARK: Data Persistence
extension FavoritesManager {
    
    // accessing Documents folder of app
    private func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    // adding new file to directory
    private func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Favorites.plist")
    }
    
    func saveFavorites() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(favoritesList)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array")
        }
    }
    
    func loadFavorites() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                favoritesList = try decoder.decode([FavoriteSelection].self, from: data)
            } catch {
                print("Error decoding item array!")
            }
        }
    }
    
    func dataFileExists() -> Bool {
        let fileManager = FileManager()
        let filePath = dataFilePath().path
        
        return fileManager.fileExists(atPath: filePath)
    }
}
