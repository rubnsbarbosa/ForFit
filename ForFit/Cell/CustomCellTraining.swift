//
//  CustomCellTraining.swift
//  ForFit
//
//  Created by Rubens Barbosa on 13/11/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class CustomCellTraining: UITableViewCell {

    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var seriesNumberLabel: UILabel!
    @IBOutlet weak var pictureTraining: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customInit(machine: String, series: String) {
        self.machineLabel.text = machine
        self.seriesNumberLabel.text = series
    }
    
}
