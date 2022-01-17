//
//  ViewController.swift
//  PBLoader
//
//  Created by Pankaj Bawane on 17/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addLoader()
    }


    private func addLoader() {
        
        // Define size.
        let loaderSize: CGSize = CGSize(width: 30.0, height: 30.0)
        
        // Let's create Petal.
        let petal = CALayer()
        let petalCount: Int = 8
        let animationDuration: TimeInterval = 0.8
        let petalSize: CGSize = CGSize(width: 6, height: loaderSize.width / 2.0) //CGSize(width: 15, height: 6)
        let petalColor: UIColor = UIColor.lightGray
        petal.backgroundColor = petalColor.cgColor
        petal.bounds.size = petalSize
        petal.cornerRadius = petalSize.width / 2
        
        // Let's position the loader in center.
        let loaderOriginX: CGFloat = (view.frame.width - loaderSize.width) / 2.0
        let loaderOriginY: CGFloat = (view.frame.height - loaderSize.height) / 2.0
        let loaderFrame: CGRect = CGRect(x: loaderOriginX, y: loaderOriginY, width: loaderSize.width, height: loaderSize.height)
        
        // Let's create Replicator Layer.
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = loaderFrame

        let angle = CGFloat.pi * 2 / CGFloat(petalCount)
        let rotation = CATransform3DMakeRotation(angle, 0, 0, 1.0)

        replicatorLayer.instanceTransform = rotation
        replicatorLayer.instanceCount = petalCount
        replicatorLayer.instanceDelay = animationDuration / TimeInterval(petalCount)

        // Animation for Petals.
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.0
        animation.repeatCount = Float.greatestFiniteMagnitude
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = animationDuration

        petal.position = CGPoint(x: loaderSize.width / 2.0, y: 0)
        petal.add(animation, forKey: nil)
        
        replicatorLayer.addSublayer(petal)
        view.layer.addSublayer(replicatorLayer)
    }
}

