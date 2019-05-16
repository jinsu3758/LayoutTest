//
//  ModalViewController.swift
//  Test
//
//  Created by 박진수 on 2019. 5. 15..
//  Copyright © 2019년 Jinsu. Park. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topView: UIView!
    
    var animator = UIViewPropertyAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topViewHeightConstraint.constant = 0
//        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panContainer(_:)))
//        commentView.addGestureRecognizer(panGesture)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("viewdid!")
    }
    
    @objc func panContainer(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: commentView)
        let translationY = sender.translation(in: view).y
        print("translation.y : \(translationY)!!")
        if abs(velocity.y) > abs(velocity.x) && translationY < 0 && abs(translationY) < UIScreen.main.bounds.height {
//            UIView.animate(withDuration: 0.1, animations: { [unowned self]  in
//                self.mainView.frame.origin = CGPoint(x: self.mainView.frame.origin.x, y: translationY)1
//
//            })
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
