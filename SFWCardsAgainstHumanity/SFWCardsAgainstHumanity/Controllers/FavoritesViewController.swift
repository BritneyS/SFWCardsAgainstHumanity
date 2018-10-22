//
//  FavoritesViewController.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/18/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit


class FavoritesViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    // MARK: Properties
    
    var favoriteSelection: FavoriteSelection?
    let favorites = FavoritesManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.favoritesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identity.favoritesCell.cellID, for: indexPath) as! FavoritesCollectionViewCell
        let favoriteSelection = favorites.favoritesList[indexPath.row]
        
        guard
            let blackCard = favoriteSelection.blackCard,
            let blackCardText = blackCard.text
        else { return cell }
        
        cell.displayBlackCardLabel(blackCardText: blackCardText)
        return cell
    }
    
    
}

