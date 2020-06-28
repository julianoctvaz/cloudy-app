//
//  DataViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 26/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var displayText: String!
    var index: Int?
    var displayImage: UIImage!
    var lastScreen: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = displayText
        image.image = displayImage
        image.frame = CGRect(x: 0, y: 0, width: 414, height: 509)
        
        // Se for a última tela, mostra botão começar
        if lastScreen == true {
            showStartButton()
        } else {
            hideStartButton()
        }
        // Do any additional setup after loading the view.
    }
    
    func showStartButton() {
        self.startButton.isHidden = false
    }
    
    func hideStartButton() {
        self.startButton.isHidden = true
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
