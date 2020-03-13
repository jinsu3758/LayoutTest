//
//  CollectionvViewController.swift
//  Test
//
//  Created by 박진수 on 16/09/2019.
//  Copyright © 2019 Jinsu. Park. All rights reserved.
//

import UIKit

class ShadowCollectionvViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var shadowViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var shadowViewHeightConstraint: NSLayoutConstraint!
    
    var tempHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.register(UINib(nibName: "ShadowReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "shadowHeader")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
//        shadowView.layer.setShadow(color: .gray, alpha: 1, x: 0, y: 2, blur: 4, spread: 0)
        shadowViewHeightConstraint.constant = 0
        collectionView.layer.setShadow(color: .gray, alpha: 1, x: 0, y: 2, blur: 4, spread: 0)
        collectionView.reloadData()
        
        
        let collectionViewHeight = collectionView.collectionViewLayout.collectionViewContentSize.height - 50
        var screenHeight = UIScreen.main.bounds.height
        var safeArea: CGFloat = 0
        if let window = UIApplication.shared.keyWindow {
            safeArea = window.safeAreaInsets.top
            screenHeight = screenHeight - safeArea
        }
        
        tempHeight = collectionView.collectionViewLayout.collectionViewContentSize.height - screenHeight - 25
        
//        if collectionViewHeight > UIScreen.main.bounds.height - 25 {
//            if let window = UIApplication.shared.keyWindow {
//                let safeArea = window.safeAreaInsets.top + window.safeAreaInsets.bottom
//                shadowViewHeightConstraint.constant = UIScreen.main.bounds.height - 25 - safeArea
//            }
//            else {
//                shadowViewHeightConstraint.constant = UIScreen.main.bounds.height - 25
//            }
//
//        }
//        else {
//            shadowViewHeightConstraint.constant = collectionViewHeight
//        }
        
//        print("\(collectionView.collectionViewLayout.collectionViewContentSize.height) / \(shadowView.frame.height)!!!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
}

extension ShadowCollectionvViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shadowCell", for: indexPath) as? ShadowCollectionViewCell {
            cell.fill()
            return cell
        }
//        cell.layer.setShadow(color: .gray, alpha: 1, x: 0, y: 2, blur: 4, spread: 1)
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "shadowTableView", sender: nil)
    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "shadowHeader", for: indexPath) as! ShadowReusableView
//        print("\(collectionView.collectionViewLayout.collectionViewContentSize.height)!!")
////        header.shadowViewHeightConstraint.constant = 1500
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 75)
//    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let contentY = scrollView.contentOffset.y
//
//        if contentY >= 0 && contentY <= 25 {
//            shadowViewTopConstraint.constant = 25 - contentY
//            self.view.layoutIfNeeded()
//        }
//
//        if contentY >= tempHeight - 10 {
//            shadowViewHeightConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.height - contentY - 25
//            self.view.layoutIfNeeded()
//        }
//        else {
//            shadowViewHeightConstraint.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
//            self.view.layoutIfNeeded()
//        }
//
//        print("temp : \(tempHeight) / contentY : \(contentY) / mainHeight : \(UIScreen.main.bounds.height) / collectionHeight : \(collectionView.collectionViewLayout.collectionViewContentSize.height)!")
//        self.view.layoutIfNeeded()
//
//
//    }
    
}
