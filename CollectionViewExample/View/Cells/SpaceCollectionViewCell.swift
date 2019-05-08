//
//  SpaceCollectionViewCell.swift
//  CollectionViewExample
//
//  Created by nury on 10/24/18.
//  Copyright © 2018 nury. All rights reserved.
//

import UIKit

class SpaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) weak var spaceImageView: UIImageView!
    @IBOutlet private(set) weak var spaceTypeLabel: UILabel!
    @IBOutlet private(set) weak var spaceAddressLabel: UILabel!
    
    var spaceImageUrl: String? {
        didSet {
            spaceImageView?.loadImage(urlString: spaceImageUrl!, placeHolderImageName: "placeholder-grey")
        }
    }
    
    var spaceType: String? {
        didSet {
            spaceTypeLabel?.text = spaceType
        }
    }
    
    var spaceAddress: String? {
        didSet {
            spaceAddressLabel?.text = spaceAddress
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        assert(spaceTypeLabel != nil)
        assert(spaceAddressLabel != nil)
        assert(spaceImageView != nil)
    }
}
