//
//  ViewController.swift
//  FacebookLiveStreamAnimation
//
//  Created by Bao Nguyen on 3/24/17.
//  Copyright © 2017 Bao Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func handleTap() {
        (0...10).forEach { (_) in
            generateAnimation()
        }
    }
    
    private func generateAnimation() {
        let image = drand48() > 0.5 ? #imageLiteral(resourceName: "like") : #imageLiteral(resourceName: "heart")
        let imageView = UIImageView(image: image)
        let dimention = 20 * drand48() + 10
        imageView.frame = CGRect(x: 0, y: 0, width: dimention, height: dimention)
        
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        let duration = 2 + drand48() + 1
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }

    private func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        let startPoint = CGPoint(x: 0, y: 200)
        path.move(to: startPoint)
        
        let randomY =  200 + drand48() * 100
        let cp1 = CGPoint(x: 100, y: 100 - randomY)
        let cp2 = CGPoint(x: 200, y: 300 + randomY)
        
        let endPoint = CGPoint(x: 400, y: 200)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
}

