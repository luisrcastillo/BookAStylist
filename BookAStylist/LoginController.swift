//
//  LoginController.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {

    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = loginView

        loginView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        loginView.registerButton.addTarget(self, action: #selector(self.handleRegister), for: .primaryActionTriggered)
        
//        view.addSubview(loginView.fieldsView)
//        view.addConstraintsWithFormat(format: "V:|-100-[v0(120)]", views: loginView.fieldsView)
//        view.addConstraintsWithFormat(format: "H:|-50-[v0]-50-|", views: loginView.fieldsView)
        
//        loginView.addConstraint(NSLayoutConstraint(item: loginView.fieldsView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 0, constant: 0))
//        loginView.addConstraint(NSLayoutConstraint(item: loginView.fieldsView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 0, constant: 0))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleRegister() {
        let userObject = Customer()
        userObject.firstName = loginView.firstNameTB.text!
        userObject.lastName = loginView.lastNameTB.text!
        userObject.email = loginView.emailTB.text!
        let password = loginView.passwordTB.text
        
        FIRAuth.auth()?.createUser(withEmail: userObject.email, password: password!, completion: { (user, error) in
            if error != nil {
                print("user creation error \(error)")
                self.showAlertWithTitle(title: "Error", message: "Error creating user: \((error?.localizedDescription)!)")
                return
            }
            //self.showAlertWithTitle(title: "Error", message: "Success!")
            guard let uid = user?.uid else {
                return
            }
            
            //success
            let ref = FIRDatabase.database().reference()
            let usersRef = ref.child("users").child("user_type").child("owner").child(uid)
            let values = ["first_name" : userObject.firstName,
                          "last_name" : userObject.lastName,
                          "email" : userObject.email]
            usersRef.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("error creating user \(error)")
                    return
                }
            })
            
            let businessRef = ref.child("business").child("business_type").child("barbershop").childByAutoId()
            let businessVal = ["business_name" : self.loginView.businessNameTB.text ?? "",
                               "business_address" : self.loginView.addressTB.text ?? "",
                               "business_city" : self.loginView.cityTB.text ?? "",
                               "business_state" : self.loginView.stateTB.text ?? "",
                               "business_zip" : self.loginView.zipcodeTB.text ?? "",
                               "business_phone" : self.loginView.phoneTB.text ?? "",
                               "business_owner_first_name" : self.loginView.firstNameTB.text ?? "",
                               "business_owner_last_name" : self.loginView.lastNameTB.text ?? ""]
            
            businessRef.updateChildValues(businessVal, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print("error creating user \(error)")
                    return
                }
            })
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
