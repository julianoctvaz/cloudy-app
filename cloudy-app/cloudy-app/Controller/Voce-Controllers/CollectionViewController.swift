//
//  CollectionViewController.swift
//  cloudy-app
//
//  Created by Juliano Vaz on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    let dataSource : [String] = ["Usa", "Brazil", "Nigeria","Morrocos","India","Japao","Espanha"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
       if let countryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell { //esse Cell marco la no na celula... resable indetifier
            countryCell.configure(with: dataSource[indexPath.row])
        
        cell = countryCell
                }
        
        return cell
    }
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Country: \(dataSource[indexPath.row])")
    }
    

    
    
    
    
  
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {

      switch kind {
      case UICollectionView.elementKindSectionHeader:
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "VoceHeaderView",
            for: indexPath) as? CollectionReusableView
          else {
            fatalError("deu ruim")
        }

        //headerView.settingsButton.setTitle("", for: .normal)
//        headerView.settingsButton.setBackgroundImage("settings-icon-tela-voce", for: .normal)
//        headerView.settingsButton.isEnabled = true
        headerView.backgroundColor = .white
       // headerView.settingsButton.setTitleColor(.black, for: .normal)
        return headerView
      default:
        // 4
        assert(false, "Invalid element type")
      }
    }

}
    


