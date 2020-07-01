//
//  PausasViewController.swift
//  cloudy-app
//
//  Created by Mayara Mendonça de Souza on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class PausasViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addPauseLabel: UILabel!
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var botaoFechar: UIButton!
    @IBOutlet weak var nomeAtividadeTextfield: UITextField!
    @IBOutlet weak var botaoSalvar: UIButton!
    
    
    @IBAction func addPauseButton(_ sender: Any) {
        print("apertou botão de adicionar pausa")
        
        let name = "John"
        labelArray.append(name)
        let indexPath = IndexPath(row: labelArray.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
       }
    
    //Backgrounds e labels dos itens da Collection View
    var backgroundArray = ["Atividade1",
                           "Atividade2",
                           "Atividade3"]
    var labelArray = ["Yoga",
                      "Origami",
                      "Observar as nuvens"]




    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension PausasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PausasDataCollectionViewCell
        
        var image = UIImage(named: backgroundArray[indexPath.row])

        //cell?.cardButton.setImage(UIImage(named: backgroundArray[indexPath.row]), for: .normal)
        
        //cell?.cardButton.setImage(#imageLiteral(resourceName: "Atividade1"), for: .normal)
        cell?.cardButton.setBackgroundImage(image, for: .normal)
        
        cell?.cardLabel.text = labelArray[indexPath.row]
        return cell!
    }


}
