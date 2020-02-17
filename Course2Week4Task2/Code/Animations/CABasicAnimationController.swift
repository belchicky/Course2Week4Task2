//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var cyanView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gestureOrangeView = UITapGestureRecognizer(target: self, action: #selector(tapOrangeView(_:)))
        let gestureCyanView = UITapGestureRecognizer(target: self, action: #selector(tapCyanView(_:)))
        let gesturetapBlueView = UITapGestureRecognizer(target: self, action: #selector(tapBlueView(_:)))
        let gestureGreenView = UITapGestureRecognizer(target: self, action: #selector(tapGreenView(_:)))
        
        orangeView.addGestureRecognizer(gestureOrangeView)
        blueView.addGestureRecognizer(gesturetapBlueView)
        cyanView.addGestureRecognizer(gestureCyanView)
        greenView.addGestureRecognizer(gestureGreenView)
        
    }
        
    @objc func tapOrangeView(_ sender: UITapGestureRecognizer) {
        animateOrangeView()
    }
    
    @objc func tapCyanView(_ sender: UITapGestureRecognizer) {
        animateCyaneView()
    }
    
    @objc func tapBlueView(_ sender: UITapGestureRecognizer) {
        animateBlueView()
    }
    
    @objc func tapGreenView(_ sender: UITapGestureRecognizer) {
        animateGreenViewreen()
    }
    
    private func animateOrangeView() {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        orangeView.layer.cornerRadius = orangeView.frame.size.height / 2
        orangeView.layer.add(animation, forKey: nil)
    }
    
    private func animateCyaneView() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        cyanView.layer.backgroundColor = .none
        cyanView.layer.add(animation, forKey: nil)
    }
    
    private func animateBlueView() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = Double.pi*2
        
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = blueView.center
        moveAnimation.toValue = CGPoint(x: cyanView.center.x, y: blueView.layer.position.y)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [rotateAnimation, moveAnimation]
        groupAnimation.duration = 2
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        groupAnimation.fillMode = .forwards
        groupAnimation.isRemovedOnCompletion = false
        blueView.layer.add(groupAnimation, forKey: "rotate")
    }
    
    private func animateGreenViewreen() {
        let moveAnimation = CABasicAnimation(keyPath: "position")
        moveAnimation.fromValue = greenView.center
        moveAnimation.toValue = view.center
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.toValue = 1.5
        
        let colorChangeAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorChangeAnimation.fromValue = UIColor.green.cgColor
        colorChangeAnimation.toValue = UIColor.magenta.cgColor
        
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [moveAnimation, scaleAnimation, colorChangeAnimation]
        groupAnimation.duration = 2
        groupAnimation.repeatCount = 2
        groupAnimation.autoreverses = true
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = .forwards
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        greenView.layer.add(groupAnimation, forKey: nil)
        
    }
    
}
