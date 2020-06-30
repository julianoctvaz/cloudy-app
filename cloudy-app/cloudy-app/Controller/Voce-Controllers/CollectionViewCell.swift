//
//  CollectionViewCell.swift
//  cloudy-app
//
//  Created by Juliano Vaz on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nomeBagdeLabel: UILabel!
    @IBOutlet weak var nuvemButton: UIButton!
    @IBOutlet weak var fundoBagdeImageView: UIImageView!
    
    
    func configure(with nomeBagde: String){
        nomeBagdeLabel.text = nomeBagde
        nomeBagdeLabel.textColor = .black
    
        
    }
    
//ver como puxar a funcao de set backgroudnuvem para ca

    @IBAction func tapButton (){
        
        print("tocou na bagde")
    }

}
