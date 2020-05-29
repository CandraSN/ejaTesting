//
//  CollectionWordsDataManager.swift
//  MembacaBersamaEja
//
//  Created by Candra Sabdana Nugroho on 29/05/20.
//  Copyright © 2020 William Sebastian Thedja. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
 var sectionData:[(alfabet:String,data:[Barang])] = []
    
    var allBarang = [
        (nama:"awan", eja:"A_W_A_N", gambar:"awan.jpg", status: true),
        (nama:"anggur", eja:"A_N_G_G_U_R", gambar:"anggur.jpg", status: false),
        (nama:"buku", eja:"B_U_K_U", gambar:"buku.jpg", status: true),
        (nama:"bakul", eja:"B_A_K_U_L", gambar:"bakul.jpg", status: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = getAllSectionData()
        _ = getAllBarang()

        // Do any additional setup after loading the view.
    }
   
    
    
    
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
