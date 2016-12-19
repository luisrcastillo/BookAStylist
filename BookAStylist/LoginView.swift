//
//  LoginView.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    let createAccountLbl: UILabel = {
        let label = UILabel()
        label.text = "Create a Business Account"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let emailTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.autocorrectionType = .no
        return field
    }()
    
    let firstNameTB: UITextField = {
        let field = UITextField()
        field.placeholder = "First Name"
        return field
    }()
    
    let lastNameTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        return field
    }()
    
    let addressTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Business Address"
        return field
    }()
    
    let businessNameTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Business Name"
        return field
    }()
    
    let cityTB: UITextField = {
        let field = UITextField()
        field.placeholder = "City"
        return field
    }()
    
    let stateTB: UITextField = {
        let field = UITextField()
        field.placeholder = "State"
        return field
    }()
    
    let statePicker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let zipcodeTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Zip Code"
        return field
    }()
    
    let passwordTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        return field
    }()
    
    let confirmPasswordTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm Password"
        field.isSecureTextEntry = true
        return field
    }()
    
    let fieldsView: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor(white: 290, alpha: 0.9)
        view.backgroundColor = UIColor.white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    let phoneTB: UITextField = {
        let field = UITextField()
        field.placeholder = "Business Number"
        return field
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        let titleColor = UIColor.blue
        //button.backgroundColor = UIColor.red
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(fieldsView)
        self.addSubview(createAccountLbl)
        fieldsView.addSubview(emailTB)
        fieldsView.addSubview(passwordTB)
        fieldsView.addSubview(firstNameTB)
        fieldsView.addSubview(lastNameTB)
        fieldsView.addSubview(businessNameTB)
        fieldsView.addSubview(addressTB)
        fieldsView.addSubview(cityTB)
        fieldsView.addSubview(stateTB)
        fieldsView.addSubview(zipcodeTB)
        fieldsView.addSubview(confirmPasswordTB)
        self.addSubview(registerButton)
        
        
        //self.addConstraintsWithFormat(format: "V:|-80-[v0]", views: )
        self.addConstraintsWithFormat(format: "V:|-80-[v0]-10-[v1(300)]-0-[v2(30)]", views: self.createAccountLbl, self.fieldsView, self.registerButton)
        self.addConstraintsWithFormat(format: "H:|-8-[v0]", views: self.createAccountLbl)
        self.addConstraintsWithFormat(format: "H:|-0-[v0]-0-|", views: self.fieldsView)
        self.addConstraintsWithFormat(format: "H:|-0-[v0]-0-|", views: registerButton)
        
        fieldsView.addConstraintsWithFormat(format: "V:|-0-[v0(30)]-0-[v1(30)]-0-[v2(30)]-0-[v3(30)]-0-[v4(30)]-0-[v5(30)]-0-[v6(30)]-0-[v7(30)]-0-[v8(30)]-0-[v9(30)]", views: firstNameTB, lastNameTB, businessNameTB, addressTB, cityTB, stateTB, zipcodeTB, emailTB, passwordTB, confirmPasswordTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: emailTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: firstNameTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: lastNameTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: passwordTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: addressTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: cityTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: stateTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: zipcodeTB)
        fieldsView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: confirmPasswordTB)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
