//
//  ViewController.swift
//  Space Calculator
//
//  Created by Rehan Javed on 09/02/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    private var sound: AVAudioPlayer!
    private var firstNumber = "0", secondNumber: String = "0"
    private enum Operater{
        case MULTIPLY
        case DIVIDE
        case ADD
        case SUBTRACT
        case NOTHING
    }
    private var selectedOperator:Operater = .NOTHING
    
    /**
     * Main method which executes when program will loads.
    */
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        let path = Bundle.main.path(forResource: "click", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        
        do{
            
            try sound = AVAudioPlayer(contentsOf: url)
            sound.prepareToPlay()
            
        }catch let exception as NSError{
            print(exception.debugDescription)
        }
        
    }
    
    /**
     * When number button is pressed.
     */
    @IBAction func numberPressedInCalculator(sender: UIButton){
        
        playSound()
        
        if selectedOperator == Operater.NOTHING{
            if firstNumber == "0"{
                firstNumber = ""
            }
            firstNumber += String(sender.tag)
            display.text = firstNumber
        }else{
            if secondNumber == "0"{
                secondNumber = ""
            }
            secondNumber += String(sender.tag)
            display.text = secondNumber
        }
        
    }
    
    /**
     * To play sound when button pressed.
     */
    private func playSound(){
    
        if sound.isPlaying{
            sound.stop()
        }
        
        sound.play()
        
    }

    @IBAction func resetBtn(_ sender: Any) {
        
        playSound()
        
        firstNumber = "0"
        secondNumber = "0"
        display.text = "0"
        selectedOperator = Operater.NOTHING
        
    }
    
    @IBAction func signChange(_ sender: Any) {
        
        playSound()
        
        if selectedOperator == .NOTHING{
            
            var percentageResult = Double(firstNumber)!
            percentageResult *= -1
            firstNumber = String(percentageResult)
            display.text = firstNumber
    
        }
        
    }
    
    @IBAction func percentageBtn(_ sender: Any) {
        
        playSound()
        
        if selectedOperator == .NOTHING{
            
            let percentageResult = Double(firstNumber)! / 100
            firstNumber = String(percentageResult)
            display.text = firstNumber
            
        }
        
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        
        playSound()
        
        selectedOperator = .DIVIDE
        display.text = "0"
        
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        
        playSound()
        
        selectedOperator = .MULTIPLY
        display.text = "0"
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        playSound()
        
        selectedOperator = .ADD
        display.text = "0"
        
    }
    
    @IBAction func subtractBtn(_ sender: Any) {
        
        playSound()
        
        selectedOperator = .SUBTRACT
        display.text = "0"
        
    }
    
    @IBAction func equalBtn(_ sender: Any) {
        
        playSound()
        
        let doubleFirstNumber = Double(firstNumber)
        let doubleSecondNumber = Double(secondNumber)
        let result: Double
        
        switch(selectedOperator)
        {
        case .MULTIPLY:
            result = doubleFirstNumber! * doubleSecondNumber!
        case .DIVIDE:
            result = doubleFirstNumber! / doubleSecondNumber!
        case .ADD:
            result = doubleFirstNumber! + doubleSecondNumber!
        case .SUBTRACT:
            result = doubleFirstNumber! - doubleSecondNumber!
        default:
            result = 0
        }
        
        display.text = String(result)
        firstNumber = "0"
        secondNumber = "0"
        selectedOperator = .NOTHING
        
    }
    
    /**
     * Throwing message on the screen.
    */
    private func throwMessage(message msg: String){
        
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        self.present(alert, animated: true)
        
        // duration in seconds
        let duration: Double = 2
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
            alert.dismiss(animated: true)
        }
        
    }
    
}

