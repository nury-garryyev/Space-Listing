//
//  SpaceCollectionView.swift
//  CollectionViewExample
//
//  Created by nury on 10/24/18.
//  Copyright © 2018 nury. All rights reserved.
//

import UIKit

private let reuseIdentifier = "spaceCell"

class SpaceListingCollectionView: UICollectionView {
    
    @IBOutlet var strongDataSource: UICollectionViewDataSource!
    
    func display(spaces: SpaceList) {
        let spaceDataSource = SpaceListingDataSource(spaces: spaces)
        dataSource = spaceDataSource
        delegate = spaceDataSource
        strongDataSource = spaceDataSource
        reloadData()
    }

}

// MARK: UICollectionViewDataSource

class SpaceListingDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let spaces: [Space]
    
    init(spaces: [Space]) {
        self.spaces = spaces
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let space = spaces[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let spaceCell = cell as? SpaceCollectionViewCell {
            spaceCell.spaceType = space.spaceType
            spaceCell.spaceAddress = space.spaceAddress
            spaceCell.spaceImageUrl = space.spaceImageUrl
        } else {
            assertionFailure("The cell should be SpaceCollectionViewCell")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 300)
    }
    
}
