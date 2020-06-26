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
    
    var displayText: String!
    var index: Int?
    var displayImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = displayText
        image.image = displayImage
        image.frame = CGRect(x: 0, y: 0, width: 414, height: 896)

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
