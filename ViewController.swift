//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // structure to hold respective egg times
    let eggTimes = ["Soft": 300,
                    "Medium": 420,
                    "Hard": 720]
    // total time timer will run
    var timeSelected = 0
    var elapsedTime = 0
    // Timer() instance to run countdown
    var timer = Timer()
    
    // sound effect
    var alarmSoundEffect: AVAudioPlayer?
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        // grab the time from the dictionary
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        // set runtime
        timeSelected = eggTimes[hardness]!
        titleLabel.text = hardness
        resetTimer()
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if elapsedTime <= timeSelected {
            let percentageProgress = Float(elapsedTime) / Float(timeSelected)
            progressBar.progress = Float(percentageProgress)
            //print("percentageProgress: \(percentageProgress)")
            //print("totalTime: \(totalTime)")
            //print("elapsedTime: \(elapsedTime)")
            elapsedTime += 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
    }
    
    func resetTimer(){
        timer.invalidate()
        progressBar.progress = 0.0
        elapsedTime = 0
    }
    
    func playSound() {
        let path = Bundle.main.path(forResource: "alarm_sound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            alarmSoundEffect = try AVAudioPlayer(contentsOf: url)
            alarmSoundEffect?.play()
        } catch {
            // couldn't load file :(
            print("Error, couldn't load resource.")
        }
    }
}
