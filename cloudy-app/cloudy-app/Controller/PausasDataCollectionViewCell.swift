//
//  PausasDataCollectionViewCell.swift
//  cloudy-app
//
//  Created by Mayara Mendonça de Souza on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class PausasDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonAction(_ sender: Any) {
        print("hello world from " + cardLabel.text!)
        
    }
    
    @IBOutlet weak var cardLabel: UILabel!
    

    
}
