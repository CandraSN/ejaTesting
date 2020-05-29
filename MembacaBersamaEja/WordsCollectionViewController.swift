//
//  WordsCollectionViewController.swift
//  MembacaBersamaEja
//
//  Created by Candra Sabdana Nugroho on 28/05/20.
//  Copyright © 2020 William Sebastian Thedja. All rights reserved.
//

import UIKit

class WordsCollectionViewController: UIViewController
{
    @IBOutlet weak var wordsCollectionViewCategories: UICollectionView!
    
    var imageWordsCollectionCategories : [WordsCollectionCategory] = ImageLibrary.fetchImages()
    var sectionData:[(alfabet:String,data:[Barang])] = []
    
    var allBarang = [
        (nama:"awan", eja:"A_W_A_N", gambar:"awan.jpg", status: true),
        (nama:"anggur", eja:"A_N_G_G_U_R", gambar:"anggur.jpg", status: false),
        (nama:"buku", eja:"B_U_K_U", gambar:"buku.jpg", status: true),
        (nama:"bakul", eja:"B_A_K_U_L", gambar:"bakul.jpg", status: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordsCollectionViewCategories.delegate = self
        wordsCollectionViewCategories.dataSource = self
        
        _ = getAllSectionData()
        _ = getAllBarang()

    }
    
//    func layoutSetupCollectionView ()
//    {
//        let leftAndRightPaddings: CGFloat = 1.0
//        let numberOfItemsPerRow: CGFloat = 3.0
//
//        let collectionViewWidth = wordsCollectionViewCategories?.frame.width
//        let itemWidth = (collectionViewWidth! - leftAndRightPaddings) / numberOfItemsPerRow
//
//        let layout = wordsCollectionViewCategories as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
//    }
    
  func getAllBarang() -> Bool {
          
          
          for (i,item) in sectionData.enumerated(){
              
              for (j,objek) in allBarang.enumerated() {
                  var index =  objek.nama.startIndex
                  if(sectionData[i].alfabet == objek.nama[index].uppercased()){
                      sectionData[i].data.append(Barang(nama:objek.nama, eja:objek.eja, gambar:objek.eja, status: objek.status))
                  }
                         
              }
              
          }
         print(sectionData)
          
          return true
      }
      
      
      func getAllSectionData() -> Bool {
          
          let alfabet:[String] = ["A","B","C"]
     
          for al in alfabet{
              
               self.sectionData.append((alfabet:al, data:[]))
          }
          
  //         allBarang.append(Barang(nama:"awan", eja:"A_W_A_N", gambar:"awan.jpg", status: true))
         
  //        print(allBarang[0].nama)
         
          return true
      }
  }


extension WordsCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("oke")
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return imageWordsCollectionCategories[section].wordsImageNameCollection.count
        print(section,"panah")
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = wordsCollectionViewCategories.dequeueReusableCell(withReuseIdentifier: "ImageWordsCell", for: indexPath) as! WordsCollectionViewCell
        let imageCategory = imageWordsCollectionCategories[indexPath.section]
        let imageNames = imageCategory.wordsImageNameCollection
        let imageName = imageNames[indexPath.item]
        
        cell.imageName = imageName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        let category = imageWordsCollectionCategories[indexPath.section]
        
        sectionHeaderView.categoryTitle = category.alphabetCategoryTitle
        
        return sectionHeaderView
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//     return CGSize(width: 100, height: 100)
//    }
    

    
}

//extension WordsCollectionViewController: UICollectionViewDelegateFlowLayout
//{
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//       return UIEdgeInsets(top: 4, left: 4, bottom: 8, right: 4)
//   }
//
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let bounds = collectionView.bounds
//       let heightVal = self.view.frame.height
//       let widthVal = self.view.frame.width
//       let cellsize = (heightVal < widthVal) ?  bounds.height/2 : bounds.width/2
//
//       return CGSize(width: cellsize - 10   , height:  cellsize - 10  )
//   }
//
//}
