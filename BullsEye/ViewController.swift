
//
//  ViewController.swift
//  BullsEye
//
//  Created by Сергей Дорошенко on 30/07/2019.
//  Copyright © 2019 Сергей Дорошенко. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var targetValue = 0 
    var score = 0
    var numberOfRounds = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberOfRoundsLabel: UILabel!
    
    var currentValue: Int {
        return Int(slider.value.rounded())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchStartOverButton()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        let title: String
        if points == 100 {
            title = "Perfect!"
            points += 100
        } else if points > 95 {
            title = "You almost had it!"
            points += 50
        } else if points > 80 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        let message =  "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { action in self.startNewRound()}
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        self.slider = slider
    }
    
    @IBAction func touchStartOverButton() {
        targetValue = 0
        score = 0
        numberOfRounds = 0
        slider.value = 50
        startNewRound()
        
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func startNewRound() {
        numberOfRounds += 1
        targetValue = Int.random(in: 1...100)
        updateLables()
    }
    func updateLables() {
        targetValueLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        numberOfRoundsLabel.text = String(numberOfRounds)
    }
}

