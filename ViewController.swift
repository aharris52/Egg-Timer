//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300,
                    "Medium": 420,
                    "Hard": 720]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // we destroy the previous instance to prevent
        // a new timer being made every time we press
        // a button
        timer.invalidate()
        
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
    
        //print("It works!")
        if secondsRemaining != 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
}