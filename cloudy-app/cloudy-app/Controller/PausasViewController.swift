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
    
    @IBAction func addPauseButton(_ sender: Any) {
           print("apertou botão de adicionar pausa")
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
    
    // Configurar botão Adicionar Pausa
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let botao = sender as? PausasDataCollectionViewCell {
            if botao.cardLabel.text == "Adicionar pausa" {
                return false
            }
        }
        /*
        guard let botao = sender as? PausasDataCollectionViewCell else {
            return false
        }
        */

        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "namePausa" {
            
        }
        
        if let tela = segue.destination as? TimerViewController, let botao = sender as? PausasDataCollectionViewCell {
            tela.namePausa = botao.cardLabel.text!
        }
    }
    //---------------------------------
}
    

extension PausasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PausasDataCollectionViewCell
        
        let image = UIImage(named: backgroundArray[indexPath.row])

        //cell?.cardButton.setImage(UIImage(named: backgroundArray[indexPath.row]), for: .normal)
        
        //cell?.cardButton.setImage(#imageLiteral(resourceName: "Atividade1"), for: .normal)
        cell?.cardButton.setBackgroundImage(image, for: .normal)
        
        cell?.cardLabel.text = labelArray[indexPath.row]
        return cell!
    }
    
    // Configura botão Adicionar Pausas
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // isHidden = false
        }
    }
    // --------------------------------

}
