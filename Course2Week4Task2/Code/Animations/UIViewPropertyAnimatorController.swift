//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
    
    
    @IBOutlet weak var animationView: UIView!
    private var animator: UIViewPropertyAnimator!
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
        let t1 = CGAffineTransform(scaleX: 1.5, y: 1.5)
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 5, timingParameters: UISpringTimingParameters(mass: 2.0, stiffness: 30.0, damping: 7.0, initialVelocity: .zero))
            animator.addAnimations {
                self.animationView.center.x += 300
                self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi)).concatenating(t1)
            }
            animator.pauseAnimation()
        case .changed:
            animator.fractionComplete = recognizer.translation(in: view).x/view.bounds.size.width
        case .ended:
            if self.view.center.x > recognizer.translation(in: view).x {
                animator.isReversed = true
                animator.startAnimation()
            } else {
                animator.startAnimation()
            }
            
        default:
            ()
        }
    }
    
}
