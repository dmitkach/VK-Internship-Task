//
//  FogController.swift
//  VK Internship Task
//
//  Created by Dmitry Tkach on 19.07.2024.
//

import Foundation
import UIKit

class FogController {
    lazy private var imageFog = UIImage(named: "Fog.png")
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = imageFog
        
        return imageView
    }()
    
    func animateFog(view: UIView) {
        guard let imageFog = self.imageFog else { return }
        imageView.frame = .init(x: -(imageFog.size.width - view.frame.width),
                                y: view.frame.height - imageFog.size.height,
                                width: imageFog.size.width,
                                height: imageFog.size.height)
        
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 10, delay: 0, animations: {
            self.imageView.frame.origin = .init(x: 0, y: self.imageView.frame.origin.y)
        }, completion: { _ in
            self.imageView.removeFromSuperview()
        })
    }
    
    func stopAnimating() {
        imageView.removeFromSuperview()
    }
}
