//
//  FavoritesViewController.swift
//  SFWCardsAgainstHumanity
//
//  Created by Britney Smith on 10/18/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

//protocol FavoritesViewControllerDelegate: class {
//    func addFavorite(controller: FavoritesViewController, didFinishAdding item: FavoriteSelection)
//}

class FavoritesViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    // MARK: Properties
    
    var favoriteSelection: FavoriteSelection?


    override func viewDidLoad() {
        super.viewDidLoad()
//        print("🃏Black Card: \(favoriteSelection!.blackCard!)")
//        print("🃏White Cards: \(favoriteSelection!.whiteCardPhrases)")
//        print("🃏isFavorited: \(favoriteSelection!.isFavorited)")
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // code
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // code
        return UICollectionViewCell()
    }
    
    
}

extension FavoritesViewController: SelectionViewControllerDelegate {
    func addFavorite(controller: SelectionViewController, didSave item: FavoriteSelection) {
        print("👍delegate method called")
        favoriteSelection = item
        print("🃏Black Card: \(favoriteSelection!.blackCard!)")
        print("🃏White Cards: \(favoriteSelection!.whiteCardPhrases)")
        print("🃏isFavorited: \(favoriteSelection!.isFavorited)")
    }
    
    
}
