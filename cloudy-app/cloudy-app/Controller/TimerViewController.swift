//
//  TimerViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var concludeButton: UIButton!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var selectTimePicker: UIPickerView!
    @IBOutlet weak var pausaNameLabel: UILabel!
    @IBOutlet weak var twoPointsLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    /*
    @IBOutlet weak var imageView0: UIImageView!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    */
    @IBOutlet weak var labelDiscretion0: UILabel!
    @IBOutlet weak var labelDiscretion1: UILabel!
    @IBOutlet weak var labelDiscretion2: UILabel!
    @IBOutlet weak var navigation: UINavigationBar!
    
    // Variáveis ScrollView
    var contentWidth: CGFloat = 0.0
    var imageView0 = UIButton()
    var imageView1 = UIButton()
    var imageView2 = UIButton()
    
    var namePausa: String = ""
    
    // Variáveis picker
    var minutesPicker = 0
    var secondsPicker = 0
    
    let feedbackVC = FeedbackViewController()
    
    // Configura botão fechar modal
    @IBAction func closedButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func concludeButtonTapped(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        //self.scrollView.isHidden = false
        print("Affff")
        //navigationController?.show(FeedbackViewController(), sender: nil)
        
    }
    
    
    // Configurando o timer
    var seconds = 5 // Esta variável manterá um valor inicial de segundos. Pode ser qualquer valor acima de 0.
    var timer = Timer()
    var isTimerRunning = false // // Isso será usado para garantir que apenas um timer seja criado por vez. (Verifique se essa variável foi declarada na classe View Controller.)
    var resumeTapped = false
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false && (minutesPicker != 0 || secondsPicker != 0) {
            // Pega a entrada do picker e passa para seconds
            self.seconds = self.secondsPicker
            self.seconds += self.minutesPicker * 60
            // Muda a label com do timer
            timerLabel.text = String(format: "%02i:%02i", self.minutesPicker, self.secondsPicker)
            runTimer()
            self.startButton.isEnabled = false
            self.startButton.isHidden = true
            self.pauseButton.isHidden = false
            self.phraseLabel.text = "Aproveite a sua pausa! \nVocê merece!"
            self.timerLabel.isHidden = false
            self.selectTimePicker.isHidden = true
            self.twoPointsLabel.isHidden = true
        }
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
            self.pauseButton.setBackgroundImage(UIImage(named: "continuar-button-timer"), for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            self.pauseButton.setBackgroundImage(UIImage(named: "pausa-button-timer"), for: .normal)
        }
    }
    // Não vamos ultilizar essa função
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60 // Aqui, inserimos manualmente o ponto de reinicialização dos segundos, mas seria mais sensato torná-lo uma variável ou constante.
        timerLabel.text = timeString(time: TimeInterval(seconds))
        
        isTimerRunning = false
        
        self.pauseButton.isEnabled = false
        self.startButton.isEnabled = true
    }
    
    func runTimer() {
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        self.pauseButton.isEnabled = true
    }
    
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            // Enviar alerta para indicar que o tempo acabou!!
            self.pauseButton.isHidden = true
            self.concludeButton.isHidden = false
            self.phraseLabel.text = "Sua pausa acabou..."
        } else {
            seconds -= 1 // Isso diminuirá (contagem regressiva) os segundos
            timerLabel.text = timeString(time: TimeInterval(seconds)) // Isso atualizará o rótulo
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        //let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectTimePicker.dataSource = self
        selectTimePicker.delegate = self
        
        self.pausaNameLabel.text = self.namePausa
        
        // Configuração ScrollView
        scrollView.isHidden = true
        scrollView.delegate = self
        
        self.imageView0.setBackgroundImage(UIImage(named: "feedback-image0"), for: .normal)
        self.imageView1.setBackgroundImage(UIImage(named: "feedback-image1"), for: .normal)
        self.imageView2.setBackgroundImage(UIImage(named: "feedback-image2"), for: .normal)
        
        
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
        
        self.scrollView.addSubview(self.imageView0)
        self.scrollView.addSubview(self.imageView1)
        self.scrollView.addSubview(self.imageView2)
        //------------------------
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*
        print(scrollView.contentOffset)
        
        if Int(scrollView.contentOffset.x) % 414 == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
        } else if Int(scrollView.contentOffset.x) % 375 == 0 {
            pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(375))
        }
        */
        
    }
}

extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Configurando picker:
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%02i", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = #colorLiteral(red: 0.2746230066, green: 0.2760953009, blue: 0.3237795234, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 30)
        
        
        label.text = String(format: "%02i", row)
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            minutesPicker = row
        } else {
            secondsPicker = row
        }
    }
    
}

let navigationController = UINavigationController()

