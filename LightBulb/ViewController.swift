//
//  ViewController.swift
//  LightBulb
//
//  Created by Jeroen de Bie on 02/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BulbOnOff: UIImageView!
    var lightsOnOff: Bool  = true
    //this controls the flicker
    var flickerController: Bool = true
    
    var Flickerimages: Array = [#imageLiteral(resourceName: "LightBulbOff"), #imageLiteral(resourceName: "LightBulbOn")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LightButtonOnOff(_ sender: Any) {
        if lightsOnOff {
            lightsOnOff = false
            BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOn")
        } else {
            lightsOnOff = true
            BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOff")
        }
    }

    @IBAction func FlickerButton(_ sender: Any) {
        if flickerController == true {
            BulbOnOff.animationImages = Flickerimages
            BulbOnOff.animationDuration = 0.2
            BulbOnOff.animationRepeatCount = 10000
            BulbOnOff.startAnimating()
            flickerController = false
        } else {
            flickerController = true
            BulbOnOff.stopAnimating()
        }
    }

}

