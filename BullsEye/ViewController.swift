//
//  ViewController.swift
//  BullsEye
//
//  Created by Madi on 2/2/16.
//  Copyright (c) 2016 Madi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 50
    var targetValue = 0
    var score = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound()
    {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels()
    {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

@IBOutlet weak var slider: UISlider!
@IBOutlet weak var targetLabel: UILabel!
@IBOutlet weak var scoreLabel: UILabel!

@IBAction func showAlert()
{
    let difference = abs(targetValue - currentValue)
    
    let points = 100 - difference
    
    score += points
    
    let message = "you scored \(points) points"
    
    let alert = UIAlertController(title: "Hello, World",
        message: message,
        preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated:true, completion: nil)
    
    startNewRound()
    
    updateLabels()
}
    
@IBAction func sliderMoved(slider: UISlider)
{
    currentValue = lroundf(slider.value)
}
    
}

