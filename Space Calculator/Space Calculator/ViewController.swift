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

    var sound: AVAudioPlayer!
    
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

    @IBAction func clearButton(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func signChanger(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func signChange(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func percentageBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func multiplyBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func subtractBtn(_ sender: Any) {
        
        playSound()
        
    }
    
    @IBAction func equalBtn(_ sender: Any) {
        
        playSound()
        
    }
    
}

