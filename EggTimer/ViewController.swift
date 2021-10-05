//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let midiumTime = 7
    let hardTime = 12
    
    @IBAction func eggButton(_ sender: UIButton) {
        let hardNess = sender.currentTitle
        
        if (hardNess == "Soft") {
            print(softTime)
        } else if (hardNess == "Medium") {
            print(midiumTime)
        } else {
            print(hardTime)
        }
    }
}
