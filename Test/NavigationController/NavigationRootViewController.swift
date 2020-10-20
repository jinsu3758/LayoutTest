//
//  NavigationRootViewController.swift
//  Test
//
//  Created by 박진수 on 2020/10/20.
//  Copyright © 2020 Jinsu. Park. All rights reserved.
//

import UIKit

class NavigationRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "상승률 BEST 테마"
        
//        let leftBarItem = UIBarButtonItem(image: UIImage.init(named: "ico_line_on"), style: .plain, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = leftBarItem
//        self.navigationController?.navigationBar.tintColor = .black
        
        

//            let rightButton = UIButton()
//            rightButton.setTitle("Right Button", for: .normal)
//            rightButton.setTitleColor(.purple, for: .normal)
//            navigationController?.navigationBar.addSubview(rightButton)
//            rightButton.tag = 1
//            rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 120, height: 20)
//
//            let targetView = self.navigationController?.navigationBar
//
//            let trailingContraint = NSLayoutConstraint(item: rightButton, attribute:
//                .trailingMargin, relatedBy: .equal, toItem: targetView,
//                                 attribute: .trailingMargin, multiplier: 1.0, constant: -16)
//            let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
//                                            toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
//            rightButton.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([trailingContraint, bottomConstraint])
        
        
        let testView = UIButton(frame: CGRect(x: self.view.frame.width, y: 0, width:120, height: 20))
        testView.setImage(UIImage.init(named: "test"), for: .normal)
        self.navigationController?.navigationBar.addSubview(testView)
        
        testView.translatesAutoresizingMaskIntoConstraints = false
        let target = navigationController!.navigationBar
        testView.bottomAnchor.constraint(equalTo: target.bottomAnchor, constant: -6).isActive = true
        testView.trailingAnchor.constraint(equalTo: target.trailingAnchor, constant: -6).isActive = true
        
//        let rightBarItem = UIBarButtonItem(customView: testView)
//        self.navigationItem.rightBarButtonItem = rightBarItem

    }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let nextVC = storyboard.instantiateViewController(withIdentifier: "nextVC") as! NextViewController
//        self.navigationController?.pushViewController(nextVC, animated: true)
    

}
