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
    @IBOutlet weak var shadowView: UIView!
    
    var screenHeight: CGFloat = 0
    var containerPoint: CGPoint = CGPoint.zero
    var modalVC: ModalViewController = ModalViewController()
    let interactor = ModalInteractor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panContainer(_:)))
        self.modalVC.commentView.addGestureRecognizer(panGesture)
        
        screenHeight = UIScreen.main.bounds.height
        self.containerViewTopConstraint.constant = screenHeight - 100
        self.containerViewHeightConstraint.constant = screenHeight
        containerPoint = self.containerView.frame.origin
        
        // bottom만 뺴고
//        shadowView.layer.masksToBounds = false
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowOpacity = 0.8
        
        
        
        
        
        
//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        shadowView.layer.shadowRadius = 4.0
        
//        let shadowRect: CGRect = shadowView.bounds.insetBy(dx: 0, dy: 4)
//        shadowView.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let modalVC = segue.destination as? ModalViewController {
            self.modalVC = modalVC
            
        }
    }
    
    @objc func panContainer(_ sender: UIPanGestureRecognizer) {
        //        let percentThreshold:CGFloat = 0.3  // 드래그해야하는 거리비율
        ////        guard let interactor = interactor else { return }
        //
        let velocity = sender.velocity(in: self.modalVC.commentView)
        //
        let translationY = sender.translation(in: containerView).y  // 팬제스쳐의 좌표
        if abs(velocity.y) > abs(velocity.x) {
            if sender.state == .ended {
                if translationY <= 0 {  // up
                    self.modalVC.topViewHeightConstraint.constant = 30
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { [unowned self] in
                        self.modalVC.topView.alpha = 1
                        self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: self.view.frame.origin.y)
                        })
                    
                }
                else {  // down
                    UIView.animate(withDuration: 0.5, delay: 0, options: .allowUserInteraction, animations: { [unowned self] in
                        self.modalVC.topView.alpha = 0
                        
                        self.containerView.frame.origin = CGPoint(x: self.containerPoint.x, y: self.containerPoint.y + 105)
                        }, completion: nil)
                    self.modalVC.topViewHeightConstraint.constant = 0
                   
                    //                UIView.animate(withDuration: 0.1, animations: { [unowned self] in
                    //                    self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: translationY)
                    //                })
                    
                }
            }
            
            //            containerPoint = self.containerView.frame.origin
            //            let transition = sender.translation(in: containerView)
            print("translationY : \(translationY)!!")
            
            
            //            if velocity.y < 0 {
            //                let transition = sender.translation(in: containerView)
            //                print("up : \(upMovement)!!!")
            //                UIView.animate(withDuration: 0.1, animations: {
            //                    self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: translation.y)
            //                })
            ////                if (changedY / 2) < screenHeight && changedY > 0 {
            //////                    containerView.center = CGPoint(x: containerView.center.x, y: changedY)
            ////                    containerView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            ////                }
            //            }
            //            else {
            //                let transition = sender.translation(in: containerView)
            //                print("down \(progress)!!!")
            //                self.containerView.frame.origin = CGPoint(x: self.containerView.frame.origin.x, y: translation.y)
            ////                if (changedY / 2) < screenHeight && changedY > 0 {
            ////                    containerView.center = centerPoint
            ////                }
            //            }
            
        }
        //
        ////        point = sender.location(in: self.view)
        //        self.view.layoutIfNeeded()
    }
    
}

