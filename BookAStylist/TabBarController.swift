//
//  TabBarController.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class TabBarController: UITabBarController, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    var timer = Timer()
    
    override func viewDidLoad(){
        var layout = UICollectionViewFlowLayout()
        
        delegate = self
        
        let businessController = UINavigationController(rootViewController: BusinessController(collectionViewLayout: layout))
        //KhoroNavigationController.tabBarItem.image = UIImage(named: "happy_face_66x66")
        
        
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.rgb(red: 09, green: 75, blue: 75, alpha: 75)
        
        viewControllers = [businessController]
        
    }
}
