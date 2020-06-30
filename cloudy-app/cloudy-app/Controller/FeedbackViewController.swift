//
//  FeedbackViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var contentWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        for image in 0...2 {
            let imageToDisplay = UIImage(named: "feedback-image\(image).png")
            //self.imageView.image = imageToDisplay
            let imageView = UIImageView(image: imageToDisplay)
            
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 50, y: (view.frame.height / 2) - 50, width: 100, height: 100)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset)
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
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
