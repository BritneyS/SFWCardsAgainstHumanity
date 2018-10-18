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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
