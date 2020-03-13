//
//  ShadowCollectionViewCell.swift
//  Test
//
//  Created by 박진수 on 16/09/2019.
//  Copyright © 2019 Jinsu. Park. All rights reserved.
//

import UIKit

class ShadowCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        self.layer.hideShadow()
    }
    
    func fill() {
//        self.layer.setShadow(color: .gray, alpha: 1, x: 0, y: 2, blur: 4, spread: 0)
//        self.layer.masksToBounds = false
//        self.layer.shadowOpacity = 0.8
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowRadius = 4.0
//
//        let shadowRect: CGRect = self.bounds.insetBy(dx: 0, dy: 4)
//        self.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        
    }
}
