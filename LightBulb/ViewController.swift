//
//  ViewController.swift
//  LightBulb
//
//  Created by Jeroen de Bie on 02/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController { // UIViewController = the Super Class //
    
    @IBOutlet weak var BulbOnOff: UIImageView!
    var lightsOnOff: Bool  = true
    //this controls the flicker
    var flickerController: Bool = true
    var Flickerimages: Array = [#imageLiteral(resourceName: "LightBulbOff"), #imageLiteral(resourceName: "LightBulbOn")]
    // (1) Create a property of type NSTimer http://stackoverflow.com/questions/24007518/how-can-i-use-nstimer-in-swift
    //Create don't initialise
    var timer = Timer()
    
    override func viewDidLoad() { // First function loading screen //
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func LightButtonOnOff(_ sender: Any) {
        if lightsOnOff {
            lightsOnOff = false
            BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOff")
            toggleTorch(on: lightsOnOff)
        } else {
            lightsOnOff = true
            BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOn")
            toggleTorch(on: lightsOnOff)
        }
    }

    @IBAction func FlickerButton(_ sender: Any) {
        // Read all this first before doing anything
        // (2) Remove the code below (not the comments!) from this function
        //     Initialise your NSTimer property... creating a scheduledTimer
        //     Read 3rd post of link for good description and code!
        //    http://stackoverflow.com/questions/24007518/how-can-i-use-nstimer-in-swift
        
        if flickerController == true {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(lightFlicker), userInfo: nil, repeats: true)
            flickerController = false
        } else {
            timer.invalidate()
            if lightsOnOff {
                toggleTorch(on: lightsOnOff)
            }
            flickerController = true

        }
        
        // (4) (Look at (3) below first!) Back in this function, stop the NSTimer, invalidate it
        //     Look at the link above to find out how to do this...3rd post down
        //     If flickerController (boolean) is true start timer
        //     If it is false then invalidate the timer
        
      
    }
    

    
    // (3) Here define a function to switch lightBulb image
    //     Function does exactly the same as other button function LightButtonOnOff

    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    func flickerTorch(on: Bool) {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }

    func lightFlicker() {
            if lightsOnOff {
                lightsOnOff = false
                BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOff")
                toggleTorch(on: lightsOnOff)
            } else {
                lightsOnOff = true
                BulbOnOff.image = #imageLiteral(resourceName: "LightBulbOn")
                toggleTorch(on: lightsOnOff)
            }
        

       }

    
}


