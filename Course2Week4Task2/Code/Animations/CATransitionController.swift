//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CATransitionController: UIViewController,  CAAnimationDelegate {
    @IBOutlet var swipeGestureRecognizer: UISwipeGestureRecognizer!	
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
        maketransit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    private  func maketransit() {
        let transit = CATransition()
        transit.type = .moveIn
        transit.duration = 1
        transit.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transit.delegate = self
        textLabel.layer.add(transit, forKey: "transition")
        textLabel.textColor = .green
        textLabel.text = "Sliding!"
    }
    
    private func fadeAnimation() {
        let fadeType = CATransition()
        fadeType.type = .fade
        fadeType.duration = 1
        fadeType.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        textLabel.layer.add(fadeType, forKey: "fade")
        textLabel.textColor = .orange
        textLabel.text = "Initial Text!"
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        textLabel.layer.removeAnimation(forKey: "transition")
        fadeAnimation()
    }
}
