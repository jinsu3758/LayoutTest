//
//  ShadowReusableView.swift
//  Test
//
//  Created by 박진수 on 19/09/2019.
//  Copyright © 2019 Jinsu. Park. All rights reserved.
//

import UIKit

class ShadowReusableView: UICollectionReusableView {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowViewHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        shadowView.layer.setShadow(color: .gray, alpha: 1, x: 0, y: 2, blur: 4, spread: 0)
    }
}
