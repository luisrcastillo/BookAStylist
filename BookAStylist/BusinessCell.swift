//
//  BusinessCell.swift
//  BookAStylist
//
//  Created by Luis Castillo on 12/15/16.
//  Copyright © 2016 Castle Apps. All rights reserved.
//

import UIKit

class BusinessCell: UICollectionViewCell {
    
    let lblBusiness: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = UIColor.white
    }
    
    func setupView() {
        self.addSubview(lblBusiness)
        
        self.addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: lblBusiness)
        self.addConstraintsWithFormat(format: "V:|-5-[v0]", views: lblBusiness)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
