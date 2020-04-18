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
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer),
                             userInfo: nil, repeats: true)
        
            
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
    }
    }
        
    func playSound(soundName: String) {
    let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            if progressBar.progress == Float(1) {
                playSound(soundName: "alarm_sound")
            }
        }
        else{
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
}

