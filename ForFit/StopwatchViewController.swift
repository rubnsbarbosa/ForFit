//
//  StopwatchViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 18/11/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {
    
    let watch = Stopwatch()

    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnStart.layer.cornerRadius = 22.0
        btnStart.layer.borderWidth = 4
        btnStart.layer.borderColor = UIColor.white.cgColor
        
        btnStop.layer.cornerRadius = 22.0
        btnStop.layer.borderWidth = 4
        btnStop.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateElapsedTimeLabel(timer: )), userInfo: nil, repeats: true)
        
        watch.start()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        watch.stop()
        
    }
    
    @objc func updateElapsedTimeLabel(timer: Timer) {
        
        if watch.isRunning {
            let minutes = Int(watch.elapsdTime / 60)
            let seconds = Int(watch.elapsdTime.truncatingRemainder(dividingBy: 60))
            let tenOfSeconds = Int(watch.elapsdTime.truncatingRemainder(dividingBy: 60) * 10)
            
            elapsedTimeLabel.text = String(format: "%02d:%02d.%d", minutes, seconds, tenOfSeconds)
        } else {
            timer.invalidate()
        }
        
    }
    
}
