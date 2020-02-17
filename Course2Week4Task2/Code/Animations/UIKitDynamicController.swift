//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
    
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var animationView: UIView!
    var mainDinamik: UIDynamicAnimator!
    var lengthBetweenViews: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lengthBetweenViews = distanceBetween2Pionst(animationView.center, anchorView.center)
        anchorView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handRecognizer)))
    }
    
    @objc func handRecognizer(gesture: UIPanGestureRecognizer) {
        let point = gesture.location(in: view)
        anchorView.center = point
        
        mainDinamik = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [animationView])
        let attached = UIAttachmentBehavior(item: animationView, attachedTo: anchorView)
        let attachAnchor = UIAttachmentBehavior(item: anchorView, attachedToAnchor: anchorView.center)
        attached.length = lengthBetweenViews
        mainDinamik.addBehavior(gravity)
        mainDinamik.addBehavior(attached)
        mainDinamik.addBehavior(attachAnchor)
    }
    
    private func distanceBetween2Pionst(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
}
