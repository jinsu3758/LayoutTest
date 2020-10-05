//
//  ButtonViewController.swift
//  Test
//
//  Created by 박진수 on 13/03/2020.
//  Copyright © 2020 Jinsu. Park. All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    @IBOutlet weak var selectedTestBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func selectedBtn(_ sender: Any) {
        if selectedTestBtn.isSelected {
            print("isSelected true")
        }
        else {
            print("isSelected false")
        }
    }
    
}
