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
    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var labelDiscretion0: UILabel!
    @IBOutlet weak var labelDiscretion1: UILabel!
    @IBOutlet weak var labelDiscretion2: UILabel!
    
    
    var contentWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        let xCoordinate0 = view.frame.midX + view.frame.width * CGFloat(0)
        let xCoordinate1 = view.frame.midX + view.frame.width * CGFloat(1)
        let xCoordinate2 = view.frame.midX + view.frame.width * CGFloat(2)
        
        self.imageView0.frame = CGRect(x: xCoordinate0 - 94, y: (view.frame.height / 2) - 50, width: 189, height: 91)
        self.imageView1.frame = CGRect(x: xCoordinate1 - 94, y: (view.frame.height / 2) - 50, width: 189, height: 91)
        self.imageView2.frame = CGRect(x: xCoordinate2 - 94, y: (view.frame.height / 2) - 50, width: 189, height: 91)
        
        self.labelDiscretion0.frame = CGRect(x: xCoordinate0 - 55, y: (view.frame.height / 2) - 86, width: 111, height: 333)
        self.labelDiscretion1.frame = CGRect(x: xCoordinate1 - 55, y: (view.frame.height / 2) - 86, width: 111, height: 333)
        self.labelDiscretion2.frame = CGRect(x: xCoordinate2 - 55, y: (view.frame.height / 2) - 86, width: 111, height: 333)

        for _ in 0...2 {
            contentWidth += view.frame.width
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset)
        
        if Int(scrollView.contentOffset.x) % 414 == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
        } else if Int(scrollView.contentOffset.x) % 375 == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(375))
        }
        
    }
    

    // Link para tutorial:
    // https://www.youtube.com/watch?v=X2Wr4TtMG6Q

}
