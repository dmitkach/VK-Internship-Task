//
//  RainController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 20.07.2024.
//

import Foundation
import UIKit

class RainController {
    private var animator: UIDynamicAnimator!
    private var gravityBehavior = UIGravityBehavior()
    
    private var drops: [UIView] = []
    
    private var timer = Timer()
    
    private var view: UIView?
    
    
    func animateRain(view: UIView) {
        
        self.view = view
        
        animator = UIDynamicAnimator(referenceView: view)
        gravityBehavior.gravityDirection.dy = 2
        animator.addBehavior(gravityBehavior)
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(createDrops), userInfo: nil, repeats: true)
        
    }
    
    @objc private func createDrops() {
        guard let view = view else { return }
        var currentDrops: [UIView] = []
        
        let dropsCount = 10
        
        for _ in 0..<dropsCount {
            let x = CGFloat(Double.random(in: 0..<view.frame.width))
            let y = CGFloat(Double.random(in: -20..<view.frame.height))
            let drop = UIView()
            
            drop.frame = CGRectMake(x, y, 1.0, 50.0)
            drop.backgroundColor = UIColor(red: 0x8C/255.0, green: 0xDF/255.0, blue: 0xE8/255.0, alpha: 1)
            drop.layer.borderWidth = 0.0
            view.addSubview(drop)
            self.drops.append(drop)
            currentDrops.append(drop)
        }
        
        for drop in currentDrops {
            gravityBehavior.addItem(drop)
        }
        
        for i in 0..<drops.count {
            if drops[i].frame.origin.y > view.frame.height {
                gravityBehavior.removeItem(drops[i])
                drops[i].removeFromSuperview()                
            }
        }
        
    }
    
    func stopAnimating() {
        timer.invalidate()
        for drop in drops {
            drop.removeFromSuperview()
        }
        
        animator.removeAllBehaviors()
        gravityBehavior = UIGravityBehavior()
    }
}
