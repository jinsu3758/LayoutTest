//
//  CustomView.swift
//  Test
//
//  Created by 박진수 on 2020/11/06.
//  Copyright © 2020 Jinsu. Park. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    static func loadViewFromNib() -> CustomView {
        
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "CustomView", bundle: bundle) //“MyViews” is name of xib file
        
        return nib.instantiate(withOwner: nil, options: nil).first as! CustomView
        //You will set restorationIdentifier later
    }
    
    class func createFromNib() -> CustomView? {
        return Bundle.main.loadNibNamed("CustomView", owner: nil, options: nil)?.first as? CustomView
    }
    
}

class StoryboardCustomView: UIView {
    var contentView: CustomView
    
    required init?(coder: NSCoder) {
        
        contentView = CustomView.loadViewFromNib()
        super.init(coder: coder)
        contentView.frame = self.bounds
        self.addSubview(contentView)
        
    }
}
