//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var flipButton: UIButton!
    @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
        moveRotateOrangeView()
    }
    
    @IBAction func flipButtonTapHandler(sender: UIButton) {
        rotateView()
    }
}

extension UIViewAnimationController {
    private func moveRotateOrangeView() {
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
            let halfwidth = self.animationView.frame.width / 2
            self.animationView.center.x = self.view.frame.maxX - halfwidth
            self.animationView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi)) })
    }
    
    private func rotateView() {
        var cheker = false
        let originState = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
        let angled = CGAffineTransform(rotationAngle: CGFloat(Float.pi))
        let angledBack = CGAffineTransform(rotationAngle: CGFloat(Float.pi * 2))
        UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseOut], animations: {
            if self.view.transform == originState {
                self.view.transform = angled
                self.flipButton.transform = angled
            } else {
                self.view.transform = angledBack
                self.flipButton.transform = angledBack
                cheker = true
            }
        })
        if cheker {self.view.transform = originState}
    }
}
