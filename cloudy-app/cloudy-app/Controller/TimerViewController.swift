//
//  TimerViewController.swift
//  cloudy-app
//
//  Created by José Henrique Fernandes Silva on 30/06/20.
//  Copyright © 2020 sorvete-napolitano. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var concludeButton: UIButton!
    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var selectTimePicker: UIPickerView!
    @IBOutlet weak var pausaNameLabel: UILabel!
    @IBOutlet weak var twoPointsLabel: UILabel!
    @IBOutlet weak var feedbackView: UIView!
    @IBOutlet weak var feelingButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var timerView0: UIView!
    @IBOutlet weak var timerView1: UIView!
    @IBOutlet weak var emotionDescriptionLabel: UILabel!
    
    // Variáveis
    var namePausa: String = ""
    var buttonImageControl = 0
    let emotionDescriptionText = ["Energizado", "Okay", "Cansado"]
    
    // Variáveis picker
    var minutesPicker = 0
    var secondsPicker = 0
    
    // Configura botão fechar modal
    @IBAction func closedButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func concludeButtonTapped(_ sender: Any) {
        self.timerView1.isHidden = true
        self.feedbackView.isHidden = false
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
            timerLabel.text = String(format: "%02i : %02i", self.minutesPicker, self.secondsPicker)
            runTimer()
            self.startButton.isEnabled = false
            self.phraseLabel.text = "Aproveite a sua pausa! \nVocê merece!"
            
            self.timerView0.isHidden = true
            self.timerView1.isHidden = false
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
            self.pauseButton.setBackgroundImage(UIImage(named: "pausar-button-timer"), for: .normal)
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
        
        return String(format: "%02i : %02i", minutes, seconds)
    }
    
    // Configura ação de fechar modal tocando no X
    @IBAction func closeModalTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Configura tela de feedback
    @IBAction func rightButtonTapped(_ sender: Any) {
        if buttonImageControl == 0 {
            buttonImageControl = 1
        } else if buttonImageControl == 1 {
            buttonImageControl = 2
        } else {
            buttonImageControl = 0
        }
        self.feelingButton.setBackgroundImage(UIImage(named: "feedback-image\(buttonImageControl)"), for: .normal)
        self.emotionDescriptionLabel.text = self.emotionDescriptionText[buttonImageControl]
        self.pageControl.currentPage = buttonImageControl
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
        if buttonImageControl == 0 {
            buttonImageControl = 2
        } else if buttonImageControl == 1 {
            buttonImageControl = 0
        } else {
            buttonImageControl = 1
        }
        self.feelingButton.setBackgroundImage(UIImage(named: "feedback-image\(buttonImageControl)"), for: .normal)
        self.emotionDescriptionLabel.text = self.emotionDescriptionText[buttonImageControl]
        self.pageControl.currentPage = buttonImageControl
    }
    
    // Enviar qual emoção vou escolhida
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let tela = segue.destination as? TimerFeedbackViewController {
            tela.nameEmotion = self.emotionDescriptionText[self.buttonImageControl]
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectTimePicker.dataSource = self
        selectTimePicker.delegate = self
        
        self.pausaNameLabel.text = self.namePausa
        
        feedbackView.isHidden = true
        timerView1.isHidden = true
        
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

