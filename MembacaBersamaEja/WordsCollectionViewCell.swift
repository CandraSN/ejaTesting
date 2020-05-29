//
//  WordsCollectionCell.swift
//  MembacaBersamaEja
//
//  Created by Candra Sabdana Nugroho on 28/05/20.
//  Copyright © 2020 William Sebastian Thedja. All rights reserved.
//

import UIKit

class WordsCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imageWordsCollection: UIImageView!
    
    var imageName: String! {
        didSet {
            imageWordsCollection.image = UIImage(named: imageName)
        }
    }
}
