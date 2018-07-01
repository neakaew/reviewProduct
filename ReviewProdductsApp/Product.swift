//
//  Product.swift
//  ReviewProdductsApp
//
//  Created by udom on 1/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import  UIKit
//import Foundation

class Product {
    
    var photo: UIImage?
    var productName: String
    var detailProduct: String
    var price: String
  
    
    // MARK: Types
    
    struct PropertyKey {
        static let photoKey = "photo"
        static let productNameKey = "productName"
        static let detailProductKey = "detailProduct"
        static let priceKey = "price"
}
    
    init?(photo: UIImage?, productName: String, detailProduct: String, price: String) {
        self.photo = photo
        self.productName = productName
        self.detailProduct = detailProduct
        self.price = price

    }
}
