//
//  Extensions.swift
//  RizzoApp
//
//  Created by punyawee  on 21/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//


import UIKit

extension UIButton {
    func playButtonSound() {
        AppManager.shared.playButtonSound()
    }
    
    func pulsate(_ duration: TimeInterval) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = duration
        pulse.fromValue = 0.77
        pulse.toValue = 1.0
        pulse.autoreverses = false
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.5
        pulse.damping = 2.0
        layer.add(pulse, forKey: "pulse")
    }
    
    func random(min: Double, max: Double) -> Double {
        return Double(arc4random()) / 0xFFFFFFFF * (max - min) + min
    }
    
    func animateBubbleAnimation() {
        
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        
        pathAnimation.calculationMode = kCAAnimationPaced
        
        pathAnimation.fillMode = kCAFillModeForwards;
        
        pathAnimation.isRemovedOnCompletion = false;
        
        pathAnimation.repeatCount = Float.infinity;
        
        pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        pathAnimation.duration = random(min: 5, max: 8)
        
        
        let curvedPath = CGMutablePath()
        
        let circleContainer = self.frame.insetBy(dx: self.frame.size.width, dy: self.frame.size.height)
        
        curvedPath.addEllipse(in: circleContainer)
        
        pathAnimation.path = curvedPath;
        
        self.layer.add(pathAnimation, forKey: "myCircleAnimation")
        
        
        let scaleX = CAKeyframeAnimation(keyPath: "transform.scale.x")
        
        scaleX.duration = 2
        
        scaleX.values = [1, 1.05, 1]
        
        let scaleXTime = random(min: 1, max: 3)
        
        scaleX.keyTimes = [0.0, NSNumber(value: scaleXTime/2), NSNumber(value: scaleXTime)]
        scaleX.repeatCount = Float.infinity;
        
        scaleX.autoreverses = true
        
        scaleX.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        
        self.layer.add(scaleX, forKey: "scaleXAnimation")
        
        let scaleY = CAKeyframeAnimation(keyPath: "transform.scale.y")
        scaleY.duration = 2.5
        scaleY.values = [1.0, 1.05, 1.0]
        let scaleYTime = random(min: 1, max: 3)
        scaleY.keyTimes = [0.0, NSNumber(value: scaleYTime/2), NSNumber(value: scaleYTime)]
        scaleY.repeatCount = Float.infinity
        scaleY.autoreverses = true
        scaleX.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        self.layer.add(scaleY, forKey: "scaleYAnimation")
    }
    
}

extension UIViewController {
    func setNavigationBar() {
        navigationItem.title = ""
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
}

extension UIImage {
    static func getImage(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIView {
    func popIn(delay: Double) {
        transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.8, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

