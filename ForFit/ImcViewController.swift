//
//  ImcViewController.swift
//  ForFit
//
//  Created by Rubens Barbosa on 21/10/2018.
//  Copyright © 2018 Rubens Barbosa. All rights reserved.
//

import UIKit

class ImcViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCalculate.layer.cornerRadius = 22.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculate(_ sender: UIButton) {
        guard let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) else {
            return
        }
        
        imc = weight / pow(height, 2)
        showResults()
        
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "magreza"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso ideal"
            image = "ideal"
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}
