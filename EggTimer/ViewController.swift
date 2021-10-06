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
    
    var audio:AVPlayer!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":500, "Medium":700, "Hard":1200]
    
    var secondPassed = 0
    
    var timer = Timer()
    
    @IBAction func eggButton(_ sender: UIButton) {
        
        timer.invalidate()
        self.progressBar.progress = 1.0
        self.titleLable.text = sender.currentTitle!
        var timeLeft = eggTimes[sender.currentTitle!]!
        let totalTime = self.eggTimes[sender.currentTitle!]!

        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if timeLeft != 0 {
                self.progressBar.progress = 1 - Float(Double(timeLeft)/Double(totalTime))
                print(self.progressBar.progress)
                timeLeft -= 1
            } else {
                timer.invalidate()
                self.progressBar.progress = 1
                self.titleLable.text = "DONE!"
                self.playAlarm()
            }
        }
    }
    
    func playAlarm() {
        // need to declare local path as url
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        // now use declared path 'url' to initialize the player
        audio = AVPlayer.init(url: url!)
        // after initialization play audio its just like click on play button
        audio.play()
    }
}
