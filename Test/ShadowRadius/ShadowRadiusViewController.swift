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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.layer.setShadow()

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
