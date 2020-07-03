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
    
    //    var contador: Int = 0
    //    var entrou: Bool = false
    //
    //https://tempojoaopessoa.jimdofree.com/nuvens/
    
    let dataSource : [String] = ["Cumulus", "Espumas ao vento", "Meteorologista", "Nevoeiro", "Cirrus", "Chuva de Benções", "Turvações","Dia Nublado","Brisa", "Observador do céu","Stratocumulus", "Neblina", "Céu Azul","Nas nuvens", "Mammatus", "Dia chuvoso", "Nimbostratus", "Cerração", "Clima fechado","Pileus", "Dia ensolarado", "Enxurrada", "Stratus", "Nacaradas", "Comulonimbus", "Aspesratus", "Nuvens Orográficas", "Cavus", "Fluctus", "Troposfera", "Estratosfera", "Mesosfera", "Termosfera", "Aurora Boreal", "Aurora Austral", "Exosfera" ]
    
    let backgroundNuvens = ["nuvem1", "nuvem2", "nuvem3", "nuvem4", "nuvem5", "nuvem6"]
    
    
    let sizeFrameNuvens : [(CGFloat, CGFloat)] = [(64.0,33.0), (64.0, 37.0), (59.0,31.0), (64.0, 37.0), (64.0,31.0), (67.0,36.0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
        
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let bagdeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell { //esse Cell marco la no na celula... resable indetifier
            bagdeCell.configure(with: dataSource[indexPath.row])
            
            let indexAleatorio = Int.random(in: 0..<6)
            
            let imageAleatoria = UIImage(named: backgroundNuvens[indexAleatorio]) //pega qq uma das imagem do array
            
            var tamanhoNuvemEmCGSize = CGSize()
            
            tamanhoNuvemEmCGSize.width = sizeFrameNuvens[indexAleatorio].0
            tamanhoNuvemEmCGSize.height = sizeFrameNuvens[indexAleatorio].1
            
            // print(tamanhoNuvemEmCGSize)
            
            bagdeCell.nuvemButton.setBackgroundImage(imageAleatoria, for: .normal)
            bagdeCell.nuvemButton.frame.size = tamanhoNuvemEmCGSize
            
            // print(bagdeCell.nuvemButton.frame.size)
            
            // contador = contador + 1 //para mostrar fundo cinza, gambiarra
            
            //        if(entrou != true){
            
            if(bagdeCell.nomeBagdeLabel.text == "Cumulus"
                || bagdeCell.nomeBagdeLabel.text == "Espumas ao vento"
                || bagdeCell.nomeBagdeLabel.text == "Meteorologista" ){
                bagdeCell.fundoBagdeImageView.image = UIImage(named: "fundo-bagdes")
            }else {
                bagdeCell.fundoBagdeImageView.image = UIImage(named: "fundo-bagde-cinza")
                // if(contador == 37) {
                // entrou = true}// quando scrolla ele n reseta a var, acumula ficaria tudo cinza
                
                
                
                //    print(contador)
            }
            cell = bagdeCell
        }
        
        return cell
    }
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell: \(dataSource[indexPath.row])")
        
        if (dataSource[indexPath.row] == "Cumulus"){
            //  self.alerta.isHidden = false
            
        }
        
    }
    
    // let alerta = UIButton()
    
    // override func loadView() {
    //https://github.com/julianoctvaz/jardimHarmonico/blob/master/jardimHarmonico.playground/Sources/1-OnboardingViewController.swift
    //
    //        self.alerta.frame = CGRect(x: 41, y: 341, width: 334, height: 336)
    //        self.alerta.setImage(UIImage(named: "fundoBotaoAlerta"), for: .normal)
    //        self.alerta.isHidden = true
    
    //        view.addSubview(alerta)
    //
    //        //Target Button
    //        self.alerta.addTarget(self, action: #selector(touchedButtonAlerta), for: .touchUpInside)
    //}
    
    //    @IBAction func touchedButtonAlerta() {
    //        self.alerta.isHidden = true
    //
    //    }
    
    var salva = UICollectionReusableView()
    
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
                headerView.backgroundColor = .white
                return headerView
            
//        case UICollectionView.elementKindSectionFooter:
//            guard let footerView = collectionView.dequeueReusableSupplementaryView(
//                ofKind: kind,
//                withReuseIdentifier: "VoceFooterView",
//                for: indexPath) as? CollectionReusableView
//                else {
//                    fatalError("deu ruim")
//                }
//                footerView.backgroundColor = .white
//                return footerView
            
            
        default:
            assert(false, "Invalid element type")
        }
        return salva
    }
    
}



