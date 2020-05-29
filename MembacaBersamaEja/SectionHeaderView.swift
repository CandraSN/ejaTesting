//
//  SectionHeaderView.swift
//  MembacaBersamaEja
//
//  Created by Candra Sabdana Nugroho on 28/05/20.
//  Copyright © 2020 William Sebastian Thedja. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView
{
    @IBOutlet weak var categoryWordsTitle: UILabel!
    
    var categoryTitle: String! {
        didSet {
            categoryWordsTitle.text = categoryTitle
        }
    }
}
