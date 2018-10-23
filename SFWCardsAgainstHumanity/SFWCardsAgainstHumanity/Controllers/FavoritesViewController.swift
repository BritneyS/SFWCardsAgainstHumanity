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
        NotificationCenter.default.addObserver(self, selector: #selector(reloadFavoritesList(notification:)), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    // MARK: Methods
    
    @objc
    func reloadFavoritesList(notification: NSNotification) {
        favoritesCollectionView.reloadData()
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
        let decodedBlackCardText = HTMLDecode.decodeHTMLString(for: blackCardText).string
        cell.displayBlackCardLabel(blackCardText: decodedBlackCardText)
        return cell
    }
}
// MARK: Segue
extension FavoritesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Identity.favoritesToSelectionSegue.segueID:
            guard let selectionViewController = segue.destination as? SelectionViewController else { return }
            let cell = sender as! FavoritesCollectionViewCell
            guard let indexPath = favoritesCollectionView.indexPath(for: cell) else { return }
            let currentFavoriteSelection = favorites.favoritesList[(indexPath.row)]
            selectionViewController.currentSelection.blackCard = currentFavoriteSelection.blackCard
            selectionViewController.currentSelection.whiteCardPhrases = currentFavoriteSelection.whiteCardPhrases
            selectionViewController.isFavorited = currentFavoriteSelection.isFavorited
        default:
            return
        }
    }
}

