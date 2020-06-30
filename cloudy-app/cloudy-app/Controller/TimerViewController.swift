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
    
    
    // Configurando o timer
    var seconds = 5 // Esta variável manterá um valor inicial de segundos. Pode ser qualquer valor acima de 0.
    var timer = Timer()
    var isTimerRunning = false // // Isso será usado para garantir que apenas um timer seja criado por vez. (Verifique se essa variável foi declarada na classe View Controller.)
    var resumeTapped = false
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
        self.startButton.isHidden = true
        self.pauseButton.isHidden = false
        self.phraseLabel.text = "Aproveite a sua pausa! \nVocê merece!"
        self.timerLabel.isHidden = false
        self.selectTimePicker.isHidden = true
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
    
    
}
