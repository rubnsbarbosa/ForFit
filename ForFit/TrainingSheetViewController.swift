//
//  TrainingSheetViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 13/11/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class TrainingSheetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewTrainingSheet: UITableView!
   
    let machine = ["pecdeck", "crossover", "climber", "machine", "chestpress", "vibratingplates", "climber", "machine"]
    
    let training = [
        ["3x12 PecDeck", "3x12 Crossover", "3x12 Climber", "3x12 HackMachine", "3x12 ChestPresss",
         "3x12 VibratingPlates", "3x12 Leg", "3x12 Panturrilha"],
        
        ["3x12 PullDown", "3x12 Remada", "3x12 Prancha", "3x12 PuxadaAlta", "3x12 PuxadorFrente", "3x12 PullDown", "3x12 Remada", "3x12 Prancha"],
        
        ["3x12 Extensora", "3x12 Plantar", "3x12 Machinee", "3x12 Agachamento", "3x12 LegPresss",
         "3x12 Mesa", "3x12 Panturrilha", "3x12 Abdominal"],
        
        ["3x12 PullUp", "3x12 Remada", "3x12 Prancha", "3x12 PuxadaAlta", "3x12 PuxadorFrente", "3x12 Remada", "3x12 Prancha", "3x12 PuxadaAlta"],
        
        ["3x12 Extensora", "3x12 FlexaoPlantar", "3x12 HackMachinee", "3x12 Agachamento", "3x12 LegPresss",
         "3x12 MesaFlexora", "3x12 Hack", "3x12 Machine"],
        
        ["3x12 Extensora", "3x12 FlexaoPlantar", "3x12 HackMachinee", "3x12 Agachamento", "3x12 LegPresss",
         "3x12 MesaFlexora", "3x12 PanturrilhaHack", "3x12 PanturrilhaMachine"],
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return training[page].count
        //return training.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewTrainingSheet.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellTraining
        
        let str = training[page][indexPath.row].components(separatedBy: " ")
        
        cell.customInit(machine: str[1], series: str[0])
        
        cell.pictureTraining.image = UIImage(named: (machine[indexPath.row] + ".png"))
//        cell.pictureTraining.image = UIImage(named: (training[indexPath.row] + ".jpg"))
//        cell.machineLabel.text = training[indexPath.row]

        return cell
    }

    @IBAction func switchCustomTableViewAction(_ sender: UISegmentedControl) {
        page = sender.selectedSegmentIndex
        tableViewTrainingSheet.reloadData()
    }
    
}
