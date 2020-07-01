//
//  PausasViewController.swift
//  cloudy-app
//
//  Created by Mayara Mendonça de Souza on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class PausasViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var nomeAtividadeTextfield: UITextField!
    
    var contadorBg: Int = 1
    
    @IBAction func botaoFechar(_ sender: Any) {
        viewPopup.isHidden = true
    }
    
    @IBAction func botaoSalvar(_ sender: Any) {
        viewPopup.isHidden = true
        addPausa()
       
    }
    
    func addPausa(){
        let nomeAtividade = nomeAtividadeTextfield.text!
        let nomeBg = "Atividade\(contadorBg)"
        
        
        
        print(nomeAtividade)
        print("tamanho array nomes")
        print(labelArray.count)
        print("tamanho array bg")
        print(backgroundArray.count)
        
        let indexPath = IndexPath(row: labelArray.count, section: 0)
        labelArray.append(nomeAtividade)
        if(contadorBg < 3){
            contadorBg += 1
        }else{
            contadorBg = 1
        }
        backgroundArray.append(nomeBg)
        
        print("tamanho array nomes")
        print(labelArray.count)
        collectionView.insertItems(at: [indexPath])
        //collectionView?.reloadData()
        
        print("adicionei na cv")
       
    }

    
    //Backgrounds e labels dos itens da Collection View
    var backgroundArray = ["AdicionarPausa",
                           "Atividade1",
                           "Atividade2",
                           "Atividade3"]
    var labelArray = ["Adicionar pausa",
                      "Yoga",
                      "Origami",
                      "Observar as nuvens"]


    override func viewDidLoad() {
        super.viewDidLoad()
        viewPopup.isHidden = true
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
    //Configurar conexão deste storyboard com o storyboard do Timer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "namePausa" {
            
        }
        
        if let tela = segue.destination as? TimerViewController, let botao = sender as? PausasDataCollectionViewCell {
            tela.namePausa = botao.cardLabel.text!
        }
    }
    
    // MARK: Functions
    private func configureTextFields(){
        // Handle the text field’s user input through delegate callbacks.
        nomeAtividadeTextfield.delegate = self
        
    }
    
    // MARK: Dismiss keyboard
    private func configureTapGesture(){
        //Dismiss the keyboard if the user taps outside of the text field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(PausasViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        print("Handle tap was called")
        view.endEditing(true)
    }
    
    
}
    

extension PausasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PausasDataCollectionViewCell
        let image: UIImage
        let indice: Int
        
        if(indexPath.row == 0){
            image = UIImage(named: backgroundArray[0])!
        }
        else{
            
            indice = (indexPath.row % backgroundArray.count)
            image = UIImage(named: backgroundArray[indexPath.row])!
            
            //image = UIImage(named: backgroundArray[0])!
        }
        cell?.cardButton.setBackgroundImage(image, for: .normal)
        cell?.cardLabel.text = labelArray[indexPath.row]

        return cell!
    }
    
    // Configura botão Adicionar Pausas
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            viewPopup.isHidden = false
        }
    }

}
