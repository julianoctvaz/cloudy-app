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
        
        //Esconder o teclado
        hideKeyboard()
        
        //Limpar o textfield para a próxima vez que tocar no botão
        nomeAtividadeTextfield.text = nil
    }
    
    @IBAction func botaoSalvar(_ sender: Any) {
        viewPopup.isHidden = true
        
        //Adicionar pausa
        addPausa()
        
        //Esconder o teclado
        hideKeyboard()
    }
    
    func addPausa(){
        let nomeAtividade = nomeAtividadeTextfield.text!
        let nomeBg = "Atividade\(contadorBg)"
        let indexPath = IndexPath(row: labelArray.count, section: 0)
        
        //Adiciona texto do textfield ao array que guarda informação das labels
        labelArray.append(nomeAtividade)
        
        
        //Define qual a imagem será exibida no background do card, para que não use a primeira e mantenha a ordem
        if(contadorBg < 3){
            contadorBg += 1
        }else{
            contadorBg = 1
        }
        
        //Insere no array de referências do nome da imagem
        backgroundArray.append(nomeBg)
       
        //Insere item na collection view
        collectionView.insertItems(at: [indexPath])
        
        //Limpar o textfield para a próxima vez que tocar no botão
        nomeAtividadeTextfield.text = nil
     
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
    }
    
    //Configurar botão Adicionar Pausa
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
    
    //Funções do texfield
    private func configureTextFields(){
        // Handle the text field’s user input through delegate callbacks.
        nomeAtividadeTextfield.delegate = self
        
    }
    
    // MARK: Dismiss keyboard
     func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("return is pressed")
        // Hide the keyboard
        hideKeyboard()
        return true
    }
    
    func hideKeyboard(){
        nomeAtividadeTextfield.resignFirstResponder()
    }
    
    
}
    
extension PausasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PausasDataCollectionViewCell
        let image:UIImage
        //Define imagem e nome dos cards da collection view
        image = UIImage(named: backgroundArray[indexPath.row])!
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
