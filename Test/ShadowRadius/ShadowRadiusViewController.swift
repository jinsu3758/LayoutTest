//
//  ShadowRadiusViewController.swift
//  Test
//
//  Created by 박진수 on 2020/10/05.
//  Copyright © 2020 Jinsu. Park. All rights reserved.
//

import UIKit

class ShadowRadiusViewController: UIViewController {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.setShadow()

        shadowView.clipsToBounds = true
        shadowView.layer.cornerRadius = 10
        shadowView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        let routeDodLine = UIView()
        routeDodLine.translatesAutoresizingMaskIntoConstraints = false
//        routeDodLine.backgroundColor = .gray
        self.view.addSubview(routeDodLine)
        
        
        routeDodLine.widthAnchor.constraint(equalToConstant: 100).isActive = true
        routeDodLine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        routeDodLine.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        routeDodLine.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        routeDodLine.heightAnchor.constraint(equalToConstant:30).isActive = true
        
        view.layoutIfNeeded()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3] // 7 is the length of dash, 3 is length of the gap.
        
        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: testView.bounds.minX, y: testView.bounds.minY), CGPoint(x: testView.bounds.maxX, y: testView.bounds.minY)])
        shapeLayer.path = path
        testView.layer.addSublayer(shapeLayer)
        routeDodLine.layer.addSublayer(shapeLayer)
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
