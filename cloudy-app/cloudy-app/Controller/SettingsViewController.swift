//
//  SettingsViewController.swift
//  cloudy-app
//
//  Created by Juliano Vaz on 01/07/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let img = UIImage(named: "setaVoltar")
//        chamou buttao tem ibaction push para tela anterior
//        self.navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        
//        var navController =  UINavigationController()
//        let messageVC = self.storyboard?.instantiateViewControllerWithIdentifier("MessagesViewController") as! MessagesViewController
//        self.presentViewController(self.navController, animated: false, completion: nil)
//        self.navController.pushViewController(messageVC, animated: false)
//
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func voltaParaTelaSettings(_ sender: Any) {
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
