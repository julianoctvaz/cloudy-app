//
//  OnboardingDelegateViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 26/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit
import UserNotifications


class OnboardingDelegateViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    let dataSource = ["Às vezes, até o sol precisa descansar atrás das nuvens \n \nVocê também pode descansar",
                      "cloudy incentiva você a fazer o que você gosta nas suas pausas",
                      "Use o seu tempo livre para fazer o que é importante para você",
                      "Descubra as pausas que fazem você se sentir melhor",
                      "Crie lembretes para momentos de pausa que tornam o seu dia mais leve"]
    
    let dataSourceImage: [UIImage] = [UIImage(imageLiteralResourceName: "Onboarding1"),
                                      UIImage(imageLiteralResourceName: "Onboarding2"),
                                      UIImage(imageLiteralResourceName: "Onboarding3"),
                                      UIImage(imageLiteralResourceName: "Onboarding4"),
                                      UIImage(imageLiteralResourceName: "Onboarding5")]
    
    var currentViewControllerIndex = 0
    
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configurePageViewController()
        self.requestNotificationAuthorization()
        self.sendNotification()
        
        // Do any additional setup after loading the view.
    }
    
    func configurePageViewController(){
        
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing:CustomPageViewController.self)) as? CustomPageViewController else {
            return
        }
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent:self)
        
        //Auto-layout
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Mudar cor do background (transparente ?)
        pageViewController.view.backgroundColor = #colorLiteral(red: 0.8867465258, green: 0.9005445838, blue: 0.9802824855, alpha: 1)
        
        
        contentView.addSubview(pageViewController.view)
        
        let views: [String: Any] = ["pageView": pageViewController.view as Any]
        
        //A subview inicia no mesmo ponto que a view que a contém
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else {
            return
        }
        
        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true)
    }
    
    
    func detailViewControllerAt(index: Int) -> DataViewController?{
        
        if index >= dataSource.count || dataSource.count == 0 {
            return nil
        }
        
        guard let dataViewController = storyboard?.instantiateViewController(withIdentifier: String(describing:DataViewController.self)) as? DataViewController else {
            return nil
        }
        
        dataViewController.index = index
        dataViewController.displayText = dataSource[index]
        dataViewController.displayImage = dataSourceImage[index]
        
        // Verifica se é a última tela
        if index == dataSource.count-1 {
            dataViewController.lastScreen = true
        } else {
            dataViewController.lastScreen = false
        }
        
        return dataViewController
    }

//    ------------------notificacao------------------
    
    //https://programmingwithswift.com/how-to-send-local-notification-with-swift-5/
    /*Só roda uma notificacao em SEGUNDO PLANO, aquilo de ciclos de vida...
    pra rodar em primeiro plano, tem que configurar tem na pagina acima.*/
    
        
    func requestNotificationAuthorization() {
        // Code here
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }
    
    
    func sendNotification() {
        // Code here
        // Create new notifcation content instance
        let notificationContent = UNMutableNotificationContent()
        
        // Add the content to the notification content
        notificationContent.title = "Teste de notificaçao"
        notificationContent.body = "Estamos de olho em você!!!"
        notificationContent.badge = NSNumber(value: 3)
        
        // Add an attachment to the notification content
        if let url = Bundle.main.url(forResource: "dune",
                                     withExtension: "png") {
            if let attachment = try? UNNotificationAttachment(
                identifier: "dune",
                url: url,
                options: nil) {
                notificationContent.attachments = [attachment]
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        
        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
        
    }
    
    
}

extension OnboardingDelegateViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else {
            return nil
        }
        
        currentViewControllerIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return detailViewControllerAt(index: currentIndex)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let dataViewController = viewController as? DataViewController
        
        guard var currentIndex = dataViewController?.index else {
            return nil
        }
        
        if currentIndex == dataSource.count {
            return nil
        }
        
        currentIndex += 1
        
        currentViewControllerIndex = currentIndex
        
        return detailViewControllerAt(index: currentIndex)
    }
    
}
