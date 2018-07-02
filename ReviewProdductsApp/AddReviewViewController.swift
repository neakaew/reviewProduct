//
//  AddReviewViewController.swift
//  ReviewProdductsApp
//
//  Created by udom on 2/7/61.
//  Copyright © พ.ศ. 2561 ReviewProducts. All rights reserved.
//
import os.log
import UIKit

class AddReviewViewController: UIViewController {

    var reviewProducts: ReviewProduct?
      var products: Product?
    
    @IBOutlet weak var detailTextViewInAddReview: UITextView!
    @IBOutlet weak var ShowImageAddReview: UIImageView!
    @IBOutlet weak var nameProductAddReview: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buttonAddReview: UIButton!
    @IBOutlet weak var buttonGreen: UIButton!
    @IBOutlet weak var buttonYellow: UIButton!
    @IBOutlet weak var buttonRed: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTextView.delegate = self as?  UITextViewDelegate
        commentTextView.text = "ข้อความ..."
        commentTextView.textColor = UIColor.lightGray
        
        detailTextViewInAddReview.delegate = self as? UITextViewDelegate
        detailTextViewInAddReview.text = "รายละเอียดสินค้า..."
        detailTextViewInAddReview.textColor = UIColor.lightGray
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let s = sender as? UIButton{
        if buttonAddReview === s {
            let commentReview = commentTextView.text ?? ""
            let nameReview = nameTextField.text ?? ""
            
            reviewProducts = ReviewProduct(productNameInTableView: commentReview, detailProductInTableView: nameReview)
            
        }
        }
        
    }
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
