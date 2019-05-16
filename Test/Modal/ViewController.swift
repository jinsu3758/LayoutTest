//
//  ViewController.swift
//  Test
//
//  Created by 박진수 on 2019. 5. 15..
//  Copyright © 2019년 Jinsu. Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewTopConstraint: NSLayoutConstraint!
    
    var screenHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panContainer(_:)))
        self.containerView.addGestureRecognizer(panGesture)
        screenHeight = UIScreen.main.bounds.height
        self.containerViewTopConstraint.constant = screenHeight - 62
        self.containerViewHeightConstraint.constant = screenHeight
    }
    
    @objc func panContainer(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: containerView)
        if abs(velocity.y) > abs(velocity.x) {
            if velocity.y < 0 {
                
                let transition = sender.translation(in: containerView)
                let changedY = containerView.center.y + transition.y
                print("up / \(changedY)!!")
                if (changedY / 2) < screenHeight && changedY > 0 {
                    containerView.center = CGPoint(x: containerView.center.x, y: changedY)
                }
            }
            else {
                
                let transition = sender.translation(in: containerView)
                let changedY = containerView.center.y + transition.y
                print("down / \(changedY)!!")
                if (changedY / 2) < screenHeight && changedY > 0 {
                    containerView.center = CGPoint(x: containerView.center.x, y: changedY)
                }
            }
            
        }
        
//        point = sender.location(in: self.view)
        self.view.layoutIfNeeded()
    }


}

