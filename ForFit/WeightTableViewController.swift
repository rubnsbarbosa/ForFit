//
//  ViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 16/10/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class WeightTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let machine = ["LegPress", "HackMachine", "LegExtension", "LegCurl"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (machine.count)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: (machine[indexPath.row] + ".jpg"))
        cell.myLabel.text = machine[indexPath.row]
        
        return (cell)
    }

}

