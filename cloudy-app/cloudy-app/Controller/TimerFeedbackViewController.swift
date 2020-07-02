//
//  TimerFeedbackViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 02/07/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class TimerFeedbackViewController: UIViewController {
    
    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var emotionTitle: UILabel!
    @IBOutlet weak var emotionText: UILabel!
    
    var nameEmotion = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionTitle.text = nameEmotion
        if nameEmotion == "Energizado" {
            emotionImage.image = UIImage(named: "feedback-image-0")
            emotionText.text = "Que bom que a sua pausa foi restauradora! Você sabia que pausas revigoram a mente e estimulam a criatividade?"
        } else if nameEmotion == "Okay" {
            emotionImage.image = UIImage(named: "feedback-image-1")
            emotionText.text = "Parabéns por ter tirado um tempo para você! Você sabia que fazer uma pausa para se movimentar traz benefícios pra sua saúde física e mental?"
        } else {
            emotionImage.image = UIImage(named: "feedback-image-2")
            emotionText.text = "Talvez você precise de uma pausa mais longa... \nTá tudo bem. Lembre de ser gentil com você mesmo."
        }
        
        // Define cores
        let azulEscuro = #colorLiteral(red: 0.6390188336, green: 0.7620211244, blue: 0.9999124408, alpha: 1)//UIColor(red: 165/255.0, green: 192/255.0, blue: 250/255.0, alpha: 1)
        let azulClaro = #colorLiteral(red: 0.8876758218, green: 0.9017826915, blue: 0.9792668223, alpha: 1)//UIColor(red: 227/255.0, green: 230/255.0, blue: 248/255.0, alpha: 1)
        
        // Gradiente:
        let newLayer = CAGradientLayer()
        newLayer.colors = [azulEscuro.cgColor, azulClaro.cgColor]
        newLayer.frame = view.frame
        view.layer.insertSublayer(newLayer, at: 0)
        //addSublayer(newLayer)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
