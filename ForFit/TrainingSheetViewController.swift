//
//  TrainingSheetViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 13/11/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class TrainingSheetViewController: UIViewController {

    @IBOutlet weak var tableViewTrainingSheet: UITableView!
    
    let training = [
        ["cadeira-extensora", "flexao-plantar", "hack-machine", "agachamento", "leg-press", "mesa-flexora", "panturrilha-hack", "panturrilha-machine"],
        []
    ]
    
    var page: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomCellTraining", bundle: nil)
        tableViewTrainingSheet.register(nib, forCellReuseIdentifier: "customCell")

        page = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func switchCustomTableViewAction(_ sender: UISegmentedControl) {
    }
    
}
