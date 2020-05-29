//
//  StrukturDataKoleksiKata.swift
//  MembacaBersamaEja
//
//  Created by Candra Sabdana Nugroho on 27/05/20.
//  Copyright © 2020 William Sebastian Thedja. All rights reserved.
//

import Foundation

struct  WordsCollectionCategory
{
    var alphabetCategoryTitle: String
    var wordsImageNameCollection: [String]
    //var spellingWord: String
}

class ImageLibrary
{
    class private func generateImage(categoryWordsCollectionName: String, numberOfImage: Int) -> [String]
    {
        var imageNames = [String]()

        for i in 1...numberOfImage {
            imageNames.append("\(categoryWordsCollectionName)\(i)")
        }

        return imageNames
    }

    class func downloadImageData() -> [String: Any]
    {
        return [
            "A": [
                "categoryName": "A",
                "imageNames": ImageLibrary.generateImage(categoryWordsCollectionName: "a", numberOfImage: 2)
            ],
            "B": [
                "categoryName": "B",
                "imageNames": ImageLibrary.generateImage(categoryWordsCollectionName: "b", numberOfImage: 1)
            ],
            "C": [
                "categoryName": "C",
                "imageNames": ImageLibrary.generateImage(categoryWordsCollectionName: "c", numberOfImage: 4)
            ],
            "D": [
                "categoryName": "D",
                "imageNames": ImageLibrary.generateImage(categoryWordsCollectionName: "d", numberOfImage: 3)
            ],
        ]
    }

    class func fetchImages() -> [WordsCollectionCategory]
    {
        var categories = [WordsCollectionCategory]()
        let imagesData = ImageLibrary.downloadImageData()

        for (categoryTitle, data) in imagesData {
            if let data = data as? [String: Any] {
                if let imagesNames = data["imageNames"] as? [String] {
                    let newCategory = WordsCollectionCategory(alphabetCategoryTitle: categoryTitle, wordsImageNameCollection: imagesNames)

                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
}

