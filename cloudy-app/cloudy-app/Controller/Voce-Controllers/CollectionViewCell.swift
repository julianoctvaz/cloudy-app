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
    
    
    func configure(with nomeBagde: String){
        nomeBagdeLabel.text = nomeBagde
        nomeBagdeLabel.textColor = .black
    }

    @IBAction func tapButton (){
        
        print("tocou na bagde")
    }

}
