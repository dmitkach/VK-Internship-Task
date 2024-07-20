//
//  CloudsController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 19.07.2024.
//

import Foundation
import UIKit

class CloudsController {
    
    lazy private var imageCloud = UIImage(named: "Cloud.png")
    lazy private var imageView1: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = imageCloud
        
        return imageView
    }()
    lazy private var imageView2: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = imageCloud
        
        return imageView
    }()
    
    
    func animateClouds(view: UIView) {
        imageView1.frame = .init(x: view.center.x - imageCloud!.size.width / 4, y: view.center.y, width: imageCloud!.size.width / 4, height: imageCloud!.size.height / 4)
        imageView2.frame = .init(x: view.center.x - imageCloud!.size.width / 4 - 20, y: view.center.y - 200, width: imageCloud!.size.width / 5, height: imageCloud!.size.height / 5)
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        
        UIView.animate(withDuration: 10, delay: 0, animations: {
            self.imageView1.frame.origin = CGPoint(x: view.frame
                .maxX, y: view.center.y)
            self.imageView2.frame.origin = CGPoint(x: view.frame
                .maxX, y: view.center.y - 200)
        }, completion: { _ in
            self.imageView1.removeFromSuperview()
            self.imageView2.removeFromSuperview()
        })
    }
    
    func stopAnimating() {
        imageView1.removeFromSuperview()
        imageView2.removeFromSuperview()
    }
    
}
