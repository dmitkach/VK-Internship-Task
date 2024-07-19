//
//  FogController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 19.07.2024.
//

import Foundation
import UIKit

class FogController {
    lazy private var imageCloud = UIImage(named: "Fog.png")
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = imageCloud
        
        return imageView
    }()
    
    func animateFog(view: UIView) {
        imageView.frame = .init(x: -(imageCloud!.size.width - view.frame.width),
                                y: view.frame.height - imageCloud!.size.height,
                                width: imageCloud!.size.width,
                                height: imageCloud!.size.height)
        
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 10, delay: 0, animations: {
            self.imageView.frame.origin = .init(x: 0, y: self.imageView.frame.origin.y)
        }, completion: { _ in
            self.imageView.removeFromSuperview()
        })
    }
}
