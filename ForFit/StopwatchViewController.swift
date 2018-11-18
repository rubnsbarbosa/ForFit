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

        // Do any additional setup after loading the view.
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
            let tenOfSeconds = Int(10 * watch.elapsdTime.truncatingRemainder(dividingBy: 60))
            
            elapsedTimeLabel.text = String(format: "%02d:%02d.%d", minutes, seconds, tenOfSeconds)
        } else {
            timer.invalidate()
        }
        
    }
    
}
