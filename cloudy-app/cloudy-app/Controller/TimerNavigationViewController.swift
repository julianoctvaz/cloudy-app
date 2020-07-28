//
//  TimerNavigationViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 07/07/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class TimerNavigationViewController: UINavigationController {

    // let timerViewController = TimerViewController()
    var namePausa = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timerViewController.namePausa = self.namePausa
        self.viewControllers.append(TimerViewController())

        // Do any additional setup after loading the view.
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
