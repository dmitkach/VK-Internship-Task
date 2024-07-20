//
//  SunController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 18.07.2024.
//

import Foundation
import UIKit

class SunController {
    
    private var path = UIBezierPath()
    
    lazy private var imageSun = UIImage(named: "Sun.png")
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = imageSun
        
        return imageView
    }()
    
    func animateSun(view: UIView) {
        CATransaction.begin()
        
        let radius = 350.0
        imageView.frame = .init(x: view.center.x - radius, y: view.center.y, width: imageSun!.size.width, height: imageSun!.size.height)
        path.move(to: CGPoint(x: view.center.x - radius, y: view.center.y))
        path.addCurve(to: CGPoint(x: view.center.x + radius, y: view.center.y),
                      controlPoint1: CGPoint(x: view.center.x - radius, y: view.center.y),
                      controlPoint2: CGPoint(x: view.center.x, y: view.center.y - radius))
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.repeatCount = 1
        animation.duration = 5
        animation.isRemovedOnCompletion = true
        
        CATransaction.setCompletionBlock({ [self] in
            imageView.frame = CGRect(x: view.center.x + radius, y: view.center.y, width: imageView.frame.width, height: imageView.frame.height)
            imageView.layer.removeAllAnimations()
            path = UIBezierPath()
            imageView.removeFromSuperview()
        })
        
        view.addSubview(imageView)
        imageView.layer.add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    func stopAnimating() {
        imageView.removeFromSuperview()
    }
}

