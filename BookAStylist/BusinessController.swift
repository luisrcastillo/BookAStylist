//
//  BusinessController.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "BusinessCell"
let ref = FIRDatabase.database().reference()


class BusinessController: UICollectionViewController {
    
    private var arr = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(BusinessCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //let barberShopRef = ref.child("Barber Shop")
        //barberShopRef.observe(.value, with: { (snapshot) in
        //ref.observe(.value, with: { (snapshot) in
//            self.arr = snapshot.value as? [String:AnyObject] ?? [:]
//            //print("Children \(arr)")
//            
//        })
        
        
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let businessType = value?["businessType"] as? NSDictionary
//            let barberShop = businessType?["Barber Shop"] as? NSDictionary
//            self.arr = barberShop as! [String : AnyObject]
//            print(self.arr)
//            //print(value?["businessType"] as? String ?? "")
//            //print(value?["businessType"])
//        })
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BusinessCell
        
        // Configure the cell
        
        //print(arr.object(at: indexPath.row))
        
        
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            let value = snapshot.value as? NSDictionary
//            let businessType = value?["businessType"] as? NSDictionary
//            let barberShop = businessType?["Barber Shop"] as? NSDictionary
//            //print(value?["businessType"] as? String ?? "")
//            //print(value?["businessType"])
//        })
        print(self.arr)
        //cell.lblBusiness.text = arr["businessType"] as! String?
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
