//
//  UIView.swift
//  Test
//
//  Created by 박진수 on 16/09/2019.
//  Copyright © 2019 Jinsu. Park. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func setShadow(color: UIColor = .black, alpha: Float = 0.5, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        }
    }
    
    func setShadowBothSide(frame: CGRect) {
        shadowOpacity = 1
        shadowOffset = CGSize(width: 0, height: 2)
        shadowRadius = 2
        let shadowRect = frame.insetBy(dx: 0, dy: 4)
        shadowPath = UIBezierPath(rect: shadowRect).cgPath
    }
    
    func setShadowSide(color: UIColor = .shadowColor, alpha: Float = 1.0, x: CGFloat = 0, y: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0.0, left: CGFloat = 0.0, right: CGFloat = 0.0, top: CGFloat = 0.0, bottom: CGFloat = 0.0) {
        setShadow(color: color, alpha: alpha, x: x, y: y, blur: blur, spread: spread)
        
        let rect = bounds.inset(by: UIEdgeInsets(top: -top, left: -left, bottom: -bottom, right: -right))
        
        shadowPath = UIBezierPath.trianglePath(rect: rect).cgPath
    }
    
    func hideShadow() {
        //        masksToBounds = true
        shadowOpacity = 0
        //        shadowColor = UIColor.clear.cgColor
        //        shadowOffset = CGSize.zero
    }
    
    func showShadow() {
        shadowOpacity = 1
        //        shadowColor = UIColor.shadowColor.cgColor
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
    class var shadowColor: UIColor {
        return UIColor(red: 39, green: 39, blue: 43, a: 0.08)
    }
}

extension UIBezierPath {
    
    class func trianglePath(rect: CGRect) -> UIBezierPath {
        let trianglePath = UIBezierPath()
        
        trianglePath.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        trianglePath.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        trianglePath.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        trianglePath.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        trianglePath.close()
        
        return trianglePath
    }
}
