//
//  ReviewProduct.swift
//  ReviewProdductsApp
//
//  Created by udom on 2/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import  UIKit
//import Foundation

class ReviewProduct {
    
        var productNameInTableView: String
        var detailProductInTableView: String
    
        
        struct PropertyKey {
            static let productNameInTableViewKey = "productname"
            static let detailProductInTableViewKey = "detailProduct"
        }
        
    init?(productNameInTableView: String, detailProductInTableView: String) {
        self.productNameInTableView = productNameInTableView
        self.detailProductInTableView = detailProductInTableView
        
    }
}
